
# Lab 6: Text Classification with LSTM

This lab corresponds to Module 6 of the "Deep Learning Explained" course.

This lab shows how to implement a recurrent network to process text,
for the [Air Travel Information Services](https://catalog.ldc.upenn.edu/LDC95S26) 
(ATIS) task of slot tagging (tag individual words to their respective classes, 
where the classes are provided as labels in the training data set).  

Our model will start with a straight-forward (linear) embedding of the words followed by a recurrent LSTM.
This will then be extended to include neighboring words and run bidirectionally.
Lastly, we will turn this system into an intent classifier.  

The techniques you will practice are:
* model building by composing layer blocks, a convenient way to compose 
  networks/models without requiring the need to write formulas,
* creating your own layer block
* variables with different sequence lengths in the same network
* training the network

We assume that you are familiar with basics of deep learning, and these specific concepts:
* recurrent networks ([Wikipedia page](https://en.wikipedia.org/wiki/Recurrent_neural_network))
* text embedding ([Wikipedia page](https://en.wikipedia.org/wiki/Word_embedding))

### Prerequisites

We assume that you have already [installed CNTK](https://github.com/Microsoft/CNTK/wiki/Setup-CNTK-on-your-machine).
This tutorial requires CNTK V2. We strongly recommend to run this tutorial on a machine with
a capable CUDA-compatible GPU. Deep learning without GPUs is not fun.

#### Downloading the data

In this tutorial we are going to use a (lightly preprocessed) version of the ATIS dataset. You can download the data automatically by running the cells below or by executing the manual instructions.

#### Fallback manual instructions
Download the ATIS [training](https://github.com/Microsoft/CNTK/blob/v2.0/Tutorials/SLUHandsOn/atis.train.ctf) 
and [test](https://github.com/Microsoft/CNTK/blob/v2.0/Tutorials/SLUHandsOn/atis.test.ctf) 
files and put them at the same folder as this notebook. If you want to see how the model is 
predicting on new sentences you will also need the vocabulary files for 
[queries](https://github.com/Microsoft/CNTK/blob/v2.0/Examples/LanguageUnderstanding/ATIS/BrainScript/query.wl) and
[slots](https://github.com/Microsoft/CNTK/blob/v2.0/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl)


```python
from __future__ import print_function # Use a function definition from future version (say 3.x from 2.7 interpreter)
import requests
import os

def download(url, filename):
    """ utility function to download a file """
    response = requests.get(url, stream=True)
    with open(filename, "wb") as handle:
        for data in response.iter_content():
            handle.write(data)

locations = ['Tutorials/SLUHandsOn', 'Examples/LanguageUnderstanding/ATIS/BrainScript']

data = {
  'train': { 'file': 'atis.train.ctf', 'location': 0 },
  'test': { 'file': 'atis.test.ctf', 'location': 0 },
  'query': { 'file': 'query.wl', 'location': 1 },
  'slots': { 'file': 'slots.wl', 'location': 1 }
}

for item in data.values():
    location = locations[item['location']]
    path = os.path.join('..', location, item['file'])
    if os.path.exists(path):
        print("Reusing locally cached:", item['file'])
        # Update path
        item['file'] = path
    elif os.path.exists(item['file']):
        print("Reusing locally cached:", item['file'])
    else:
        print("Starting download:", item['file'])
        url = "https://github.com/Microsoft/CNTK/blob/v2.0/%s/%s?raw=true"%(location, item['file'])
        download(url, item['file'])
        print("Download completed")

```

    Reusing locally cached: slots.wl
    Reusing locally cached: atis.train.ctf
    Reusing locally cached: query.wl
    Reusing locally cached: atis.test.ctf


#### Importing CNTK and other useful libraries

CNTK's Python module contains several submodules like `io`, `learner`, and `layers`. We also use NumPy in some cases since the results returned by CNTK work like NumPy arrays.


```python
import math
import numpy as np

import cntk as C
```

In the block below, we check if we are running this notebook in the CNTK internal test machines by looking for environment variables defined there. We then select the right target device (GPU vs CPU) to test this notebook. In other cases, we use CNTK's default policy to use the best available device (GPU, if available, else CPU).


```python
# Select the right target device when this notebook is being tested:
if 'TEST_DEVICE' in os.environ:
    if os.environ['TEST_DEVICE'] == 'cpu':
        C.device.try_set_default_device(C.device.cpu())
    else:
        C.device.try_set_default_device(C.device.gpu(0))
```


```python
# Test for CNTK version
if not C.__version__ == "2.0":
    raise Exception("this notebook was designed to work with 2.0. Current Version: " + C.__version__) 
```

## Task and Model Structure

The task we want to approach in this tutorial is slot tagging.
We use the [ATIS corpus](https://catalog.ldc.upenn.edu/LDC95S26).
ATIS contains human-computer queries from the domain of Air Travel Information Services,
and our task will be to annotate (tag) each word of a query with the specific item of information (slot) it belongs to, if any.

The data in your working folder has already been converted into a CTF (CNTK Text Format) file.
Let us look at an example from the test-set file `atis.test.ctf`:

    19  |S0 178:1 |# BOS      |S1 14:1 |# flight  |S2 128:1 |# O
    19  |S0 770:1 |# show                         |S2 128:1 |# O
    19  |S0 429:1 |# flights                      |S2 128:1 |# O
    19  |S0 444:1 |# from                         |S2 128:1 |# O
    19  |S0 272:1 |# burbank                      |S2 48:1  |# B-fromloc.city_name
    19  |S0 851:1 |# to                           |S2 128:1 |# O
    19  |S0 789:1 |# st.                          |S2 78:1  |# B-toloc.city_name
    19  |S0 564:1 |# louis                        |S2 125:1 |# I-toloc.city_name
    19  |S0 654:1 |# on                           |S2 128:1 |# O
    19  |S0 601:1 |# monday                       |S2 26:1  |# B-depart_date.day_name
    19  |S0 179:1 |# EOS                          |S2 128:1 |# O

This file has 5-7 columns per line (each separated by the "|" character):

* a sequence id (19). There are 11 entries with this sequence id. This means that sequence 19 consists
of 11 tokens;
* column `S0`, which contains numeric word indices; the input data is encoded in one-hot vectors.  There are 943 words in the vocabulary, so each word is a 943 element vector of all 0 with a 1 at a vector index chosen to represent that word.  For example the word "from" is represented with a 1 at index 444 and zero everywhere else in the vector. The word "monday" is represented with a 1 at index 601 and zero everywhere else in the vector.
* a comment column denoted by `#`, to allow a human reader to know what the numeric word index stands for;
Comment columns are ignored by the system. `BOS` and `EOS` are special words
to denote beginning and end of sentence, respectively;
* column `S1` is an intent label, which we will only use in the last part of the tutorial;
* another comment column that shows the human-readable label of the numeric intent index;
* column `S2` is the slot label, represented as a numeric index; and
* another comment column that shows the human-readable label of the numeric label index.

The task of the neural network is to look at the query (column `S0`) and predict the
slot label (column `S2`).
As you can see, each word in the input gets assigned either an empty label `O`
or a slot label that begins with `B-` for the first word, and with `I-` for any
additional consecutive word that belongs to the same slot.

The model we will use is a recurrent model consisting of an embedding layer,
a recurrent LSTM cell, and a dense layer to compute the posterior probabilities:


    slot label   "O"        "O"        "O"        "O"  "B-fromloc.city_name"
                  ^          ^          ^          ^          ^
                  |          |          |          |          |
              +-------+  +-------+  +-------+  +-------+  +-------+
              | Dense |  | Dense |  | Dense |  | Dense |  | Dense |  ...
              +-------+  +-------+  +-------+  +-------+  +-------+
                  ^          ^          ^          ^          ^
                  |          |          |          |          |
              +------+   +------+   +------+   +------+   +------+   
         0 -->| LSTM |-->| LSTM |-->| LSTM |-->| LSTM |-->| LSTM |-->...
              +------+   +------+   +------+   +------+   +------+   
                  ^          ^          ^          ^          ^
                  |          |          |          |          |
              +-------+  +-------+  +-------+  +-------+  +-------+
              | Embed |  | Embed |  | Embed |  | Embed |  | Embed |  ...
              +-------+  +-------+  +-------+  +-------+  +-------+
                  ^          ^          ^          ^          ^
                  |          |          |          |          |
    w      ------>+--------->+--------->+--------->+--------->+------... 
                 BOS      "show"    "flights"    "from"   "burbank"

Descriptions of the above Layer functions can be found at: [the CNTK Layers Reference Documentation](http://cntk.ai/pythondocs/layerref.html).

Below, we build the CNTK model for this network. Please have a quick look and match it with the description above.




```python
# setting seed
np.random.seed(0)
C.cntk_py.set_fixed_random_seed(1)
C.cntk_py.force_deterministic_algorithms()

# number of words in vocab, slot labels, and intent labels
vocab_size = 943 ; num_labels = 129 ; num_intents = 26    

# model dimensions
input_dim  = vocab_size
label_dim  = num_labels
emb_dim    = 150 #300 #50 #150
hidden_dim = 300 #500 #100 #300

# Create the containers for input feature (x) and the label (y)
x = C.sequence.input_variable(vocab_size)
y = C.sequence.input_variable(num_labels)

def create_model():
    with C.layers.default_options(initial_state=0.1):
        return C.layers.Sequential([
            C.layers.Embedding(emb_dim, name='embed'),
            C.layers.Recurrence(C.layers.LSTM(hidden_dim), go_backwards=False),
            C.layers.Dense(num_labels, name='classify')
        ])
```

Now we are ready to create a model and inspect it. 

Once a model is constructed, its attributes are fully accessible from Python. The first layer named `embed` is an Embedding layer. Here we use the CNTK default, which is linear embedding. It is a simple matrix with dimension (input word encoding x output projected dimension). You can access its parameter `E` (where the embeddings are stored) like any other attribute of a Python object. Its shape contains a `-1` which indicates that this parameter (with input dimension) is not fully specified yet, while the output dimension is set to `emb_dim` ( = 150 in this tutorial). 

Additionally we also inspect the value of the bias vector in the `Dense` layer named `classify`. The `Dense` layer is a fundamental compositional unit of a Multi-Layer Perceptron (as introduced in Lab 3). Each `Dense` layer has both `weight` and `bias` parameters.  Bias terms are by default initialized to 0 (but there is a way to change that if you need). As you create the model, one can name the layer component and then access the parameters as shown here. 

**Suggested Exploration**: What should be the expected dimension of the `weight` matrix from the layer named `classify`.  Try printing the weight matrix of the `classify` layer.  Does it match with your expected size?


```python
# peek
z = create_model()
print(z.embed.E.shape)
print(z.classify.b.value)
```

    (-1, 150)
    [ 0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.
      0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.
      0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.
      0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.
      0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.
      0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.
      0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.
      0.  0.  0.]


Our input text words will be encoded as one-hot vectors of length 943 and the output dimension of our model `emb_dim` is set to 150. In the code below we pass the input variable `x` to our model `z`. This binds the model with input data of known shape. In this case, the input shape will be the size of the input vocabulary. With this modification, the parameter returned by the embed layer is completely specified (943, 150). 

**Note**: As an alternative to our approach here, you can initialize the Embedding matrix with pre-computed vectors using [Word2Vec](https://en.wikipedia.org/wiki/Word2vec) or [GloVe](https://en.wikipedia.org/wiki/GloVe_(machine_learning)).


```python
# Pass an input and check the dimension
z = create_model()
print(z(x).embed.E.shape)
```

    (943, 150)




[comment]: <> (For testing ...)

### A Brief Look at Data and Data Reading

For reading text, this tutorial uses the `CNTKTextFormatReader`. It expects the input data to be
in the CTF format, as described [here](https://github.com/Microsoft/CNTK/wiki/CNTKTextFormat-Reader).

But how do you generate this format?  For this tutorial, we created the CTF file for you, but it might be helpful to explain how this was accomplished.  The data was created in two steps:
* convert the raw data into a plain text file that contains of TAB-separated columns of space-separated text. For example:

  ```
  BOS show flights from burbank to st. louis on monday EOS (TAB) flight (TAB) O O O O B-fromloc.city_name O B-toloc.city_name I-toloc.city_name O B-depart_date.day_name O
  ```

  This is meant to be compatible with the output of the `paste` command.
  
  
* convert it to CNTK Text Format (CTF) with the following command:

  ```
  python [CNTK root]/Scripts/txt2ctf.py --map query.wl intent.wl slots.wl --annotated True --input atis.test.txt --output atis.test.ctf
  ```
  where the three `.wl` files give the vocabulary as plain text files, one word per line.

In these CTF files, our columns are labeled `S0`, `S1`, and `S2`.
These are connected to the actual network inputs by the corresponding lines in the reader definition:


```python
def create_reader(path, is_training):
    return C.io.MinibatchSource(C.io.CTFDeserializer(path, C.io.StreamDefs(
         query         = C.io.StreamDef(field='S0', shape=vocab_size,  is_sparse=True),
         intent_unused = C.io.StreamDef(field='S1', shape=num_intents, is_sparse=True),  
         slot_labels   = C.io.StreamDef(field='S2', shape=num_labels,  is_sparse=True)
     )), randomize=is_training, max_sweeps = C.io.INFINITELY_REPEAT if is_training else 1)
```


```python
# peek
reader = create_reader(data['train']['file'], is_training=True)
reader.streams.keys()
```




    dict_keys(['slot_labels', 'query', 'intent_unused'])



### Trainer

We also must define the training criterion (loss function), and also an error metric to track the progress of our model's performance. In most tutorials, we know the input dimensions and the corresponding labels. We directly create the loss and the error functions. In this tutorial we will do the same. However, we take a brief detour and learn about placeholders. This concept would be useful for Task 3. 

**Learning note**: Introduction to `placeholder`: Remember that the code we have been writing is not actually executing any heavy computation it is just specifying the function we want to compute on data during training/testing. And in the same way that it is convenient to have names for arguments when you write a regular function in a programming language, it is convenient to have placeholders that refer to arguments (or local computations that need to be reused). Eventually, some other code will replace these placeholders with other known quantities in the same way that in a programming language the function will be called with concrete values bound to its arguments. 

Specifically, the input variables you have created above `x = C.sequence.input_variable(vocab_size)` holds data pre-defined by `vocab_size`. In the case where such instantiations are challenging or not possible, using `placeholder` is a logical choice. Having the `placeholder` only allows you to defer the specification of the argument at a later time when you may have the data.

Here is an example below that illustrates the use of `placeholder`.


```python
def create_criterion_function(model):
    labels = C.placeholder(name='labels')
    ce   = C.cross_entropy_with_softmax(model, labels)
    errs = C.classification_error      (model, labels)
    return C.combine ([ce, errs]) # (features, labels) -> (loss, metric)

criterion = create_criterion_function(create_model())
criterion.replace_placeholders({criterion.placeholders[0]: C.sequence.input_variable(num_labels)})
```




    Composite(Combine): Input('Input10854', [#, *], [129]), Placeholder('labels', [???], [???]) -> Output('Block10824_Output_0', [#, *], [1]), Output('Block10844_Output_0', [#, *], [])



While the cell above works well when one has input parameters defined at network creation, it compromises readability. Hence we prefer creating functions as shown below


```python
def create_criterion_function_preferred(model, labels):
    ce   = C.cross_entropy_with_softmax(model, labels)
    errs = C.classification_error      (model, labels)
    return ce, errs # (model, labels) -> (loss, error metric)
```

### Training the model

We are using the Progress Printer to display the training loss and classification error throughout training epochs.

The training should take less than 2 minutes on a Titan-X or a Surface Book. Once the training completed, you will see an output like this
```
Finished Epoch [10]: [Training] loss = 0.033263 * 18039, metric = 0.9% * 18039
```
which is the loss (cross entropy) and the metric (classification error) averaged over the final epoch.

On a CPU-only machine, it can be 4 or more times slower. You can try setting
```python
emb_dim    = 50 
hidden_dim = 100
```
to reduce the time it takes to run on a CPU, but the model will not fit as well as when the 
hidden and embedding dimension are larger. 

### Testing the model

We also use the Progress Printer to display the accuracy on a test set by computing the error over multiple minibatches of test data. For evaluating on a small sample read from a file, you can set a minibatch size reflecting the sample size and run the test_minibatch on that instance of data. To see how to evaluate a single sequence, we provide an instance later in the tutorial. 


```python
def train_test(train_reader, test_reader, model_func, max_epochs=10):
    
    # Instantiate the model function; x is the input (feature) variable 
    model = model_func(x)
    
    # Instantiate the loss and error function
    loss, label_error = create_criterion_function_preferred(model, y)

    # training config
    epoch_size = 18000        # 18000 samples is half the dataset size 
    minibatch_size = 70
    
    # LR schedule over epochs 
    # In CNTK, an epoch is how often we get out of the minibatch loop to
    # do other stuff (e.g. checkpointing, adjust learning rate, etc.)
    # (we don't run this many epochs, but if we did, these are good values)
    lr_per_sample = [0.003]*4+[0.0015]*24+[0.0003]
    lr_per_minibatch = [lr * minibatch_size for lr in lr_per_sample]
    lr_schedule = C.learning_rate_schedule(lr_per_minibatch, C.UnitType.minibatch, epoch_size)
    
    # Momentum schedule
    momentum_as_time_constant = C.momentum_as_time_constant_schedule(700)
    
    # We use a the Adam optimizer which is known to work well on this dataset
    # Feel free to try other optimizers from 
    # https://www.cntk.ai/pythondocs/cntk.learner.html#module-cntk.learner
    learner = C.adam(parameters=model.parameters,
                     lr=lr_schedule,
                     momentum=momentum_as_time_constant,
                     gradient_clipping_threshold_per_sample=15, 
                     gradient_clipping_with_truncation=True)
    #learner = C.momentum_sgd(parameters=model.parameters, lr=lr_schedule,momentum=momentum_as_time_constant)
    #learner = C.sgd(parameters=model.parameters, lr=lr_schedule)
    #learner = C.fsadagrad(model.parameters, 
    #                  lr = lr_schedule, 
    #                  momentum = momentum_as_time_constant)

    # Setup the progress updater
    progress_printer = C.logging.ProgressPrinter(tag='Training', num_epochs=max_epochs)
    
    # Uncomment below for more detailed logging
    #progress_printer = ProgressPrinter(freq=100, first=10, tag='Training', num_epochs=max_epochs) 

    # Instantiate the trainer
    trainer = C.Trainer(model, (loss, label_error), learner, progress_printer)

    # process minibatches and perform model training
    C.logging.log_number_of_parameters(model)

    t = 0
    for epoch in range(max_epochs):         # loop over epochs
        epoch_end = (epoch+1) * epoch_size
        while t < epoch_end:                # loop over minibatches on the epoch
            data = train_reader.next_minibatch(minibatch_size, input_map={  # fetch minibatch
                x: train_reader.streams.query,
                y: train_reader.streams.slot_labels
            })
            trainer.train_minibatch(data)               # update model with it
            t += data[y].num_samples                    # samples so far
        trainer.summarize_training_progress()
    
    while True:
        minibatch_size = 500
        data = test_reader.next_minibatch(minibatch_size, input_map={  # fetch minibatch
            x: test_reader.streams.query,
            y: test_reader.streams.slot_labels
        })
        if not data:                                 # until we hit the end
            break
        trainer.test_minibatch(data)
    
    trainer.summarize_test_progress()
```


```python
def do_train_test():
    global z
    z = create_model()
    train_reader = create_reader(data['train']['file'], is_training=True)
    test_reader = create_reader(data['test']['file'], is_training=False)
    train_test(train_reader, test_reader, z)
```


```python
do_train_test()
```

    Training 721479 parameters in 6 parameter tensors.
    Learning rate per minibatch: 0.21
    Finished Epoch[1 of 10]: [Training] loss = 1.746585 * 18010, metric = 31.43% * 18010 10.152s (1774.0 samples/s);
    Finished Epoch[2 of 10]: [Training] loss = 1.134891 * 18051, metric = 24.30% * 18051 7.600s (2375.1 samples/s);
    Finished Epoch[3 of 10]: [Training] loss = 0.818286 * 17941, metric = 17.19% * 17941 3.141s (5711.9 samples/s);
    Finished Epoch[4 of 10]: [Training] loss = 0.706145 * 18059, metric = 15.53% * 18059 6.713s (2690.2 samples/s);
    Learning rate per minibatch: 0.105
    Finished Epoch[5 of 10]: [Training] loss = 0.608130 * 17957, metric = 13.54% * 17957 3.577s (5020.1 samples/s);
    Finished Epoch[6 of 10]: [Training] loss = 0.606430 * 18021, metric = 13.59% * 18021 5.856s (3077.4 samples/s);
    Finished Epoch[7 of 10]: [Training] loss = 0.543445 * 17980, metric = 12.51% * 17980 3.369s (5336.9 samples/s);
    Finished Epoch[8 of 10]: [Training] loss = 0.541820 * 18025, metric = 12.23% * 18025 5.600s (3218.8 samples/s);
    Finished Epoch[9 of 10]: [Training] loss = 0.488516 * 17956, metric = 11.33% * 17956 3.418s (5253.4 samples/s);
    Finished Epoch[10 of 10]: [Training] loss = 0.471037 * 18039, metric = 10.87% * 18039 6.223s (2898.8 samples/s);
    Finished Evaluation [1]: Minibatch[1-23]: metric = 11.83% * 10984;


This shows how learning proceeds over epochs (passes through the data).
For example, after four epochs, the loss, which is the cross-entropy criterion, has reached 0.11 as measured on the ~18000 samples of this epoch,
and that the error rate is 2.6% on those same 18000 training samples.

The epoch size is the number of samples--counted as *word tokens*, not sentences--to
process between model checkpoints.

Once the training has completed (a little less than 2 minutes on a Titan-X or a Surface Book),
you will see an output like this
```
Finished Epoch [10]: [Training] loss = 0.033263 * 18039, metric = 0.9% * 18039
```
which is the loss (cross entropy) and the metric (classification error) averaged over the final epoch.

On a CPU-only machine, it can be 4 or more times slower. You can try setting
```python
emb_dim    = 50 
hidden_dim = 100
```
to reduce the time it takes to run on a CPU, but the model will not fit as well as when the 
hidden and embedding dimension are larger. 


```python
z.classify.b.value
```




    array([ -1.37134427e-02,   9.67173874e-02,   4.96409506e-01,
            -3.34382355e-02,  -2.62637790e-02,  -1.02342948e-01,
             6.84437528e-03,  -3.19935828e-02,  -4.14444134e-02,
            -1.33351192e-01,  -7.09304065e-02,  -1.10223576e-01,
            -2.09276341e-02,  -8.32259059e-02,   1.16128497e-01,
             7.97470361e-02,  -1.23644389e-01,   1.71400681e-01,
             1.89843610e-01,  -1.39666498e-01,  -2.83103145e-04,
             2.71999657e-01,  -1.34364501e-01,  -1.48174644e-01,
            -1.28207698e-01,   1.93696450e-02,   2.54588813e-01,
             8.25889185e-02,   9.13422480e-02,  -2.83280970e-03,
            -7.33795986e-02,  -2.28415970e-02,  -4.97628860e-02,
             3.13546211e-01,  -6.28049821e-02,   2.04132050e-01,
             1.15978912e-01,  -1.13179646e-02,  -2.09277440e-02,
             4.05147076e-02,  -1.56359419e-01,   1.02596609e-02,
             2.85802126e-01,   6.07208833e-02,   1.73445061e-01,
             5.06741814e-02,  -1.02856137e-01,  -3.15864161e-02,
             3.42701316e-01,  -3.40186693e-02,  -6.27719462e-02,
             2.20226590e-02,  -1.04167357e-01,  -1.24087948e-02,
            -4.97467332e-02,  -1.39719918e-01,  -5.34851383e-03,
            -1.11543901e-01,  -2.58935615e-02,  -8.84551704e-02,
            -1.33120716e-01,  -1.06888302e-01,  -1.12067781e-01,
            -1.49607807e-01,  -1.37277082e-01,  -1.01301998e-01,
             3.37359279e-01,  -9.03383568e-02,  -1.17486037e-01,
            -1.47493854e-01,  -1.23283006e-01,   5.05632162e-03,
            -1.18249878e-01,  -1.32560775e-01,  -1.34514496e-01,
            -1.38013452e-01,  -8.18156600e-02,  -4.24663760e-02,
             1.92120209e-01,  -1.16066046e-01,  -4.99237105e-02,
            -2.82622203e-02,   2.39552837e-02,   2.32068002e-01,
            -2.20332993e-03,  -1.15466803e-01,  -8.12751576e-02,
            -1.31267309e-01,  -9.69831944e-02,   8.42222348e-02,
            -1.55808240e-01,  -2.32938733e-02,   1.66328877e-01,
             3.33185196e-02,  -1.22164808e-01,   2.21291669e-02,
            -6.95813969e-02,  -8.20054486e-02,  -1.33105844e-01,
            -9.54720080e-02,   1.86091468e-01,  -1.26762837e-01,
            -1.19973525e-01,  -2.69149523e-02,  -1.31116971e-01,
            -8.93896744e-02,  -1.27957955e-01,  -6.90435395e-02,
            -3.98732796e-02,  -1.00749945e-02,   1.04290731e-01,
            -1.05040073e-01,  -1.23292752e-01,  -1.45663768e-01,
            -1.07188605e-01,  -6.16470836e-02,  -1.35291696e-01,
            -1.13151491e-01,  -1.38089538e-01,   3.03916812e-01,
            -1.41075134e-01,  -2.32003484e-04,  -1.27800673e-01,
            -1.21320263e-01,  -4.35670316e-02,   8.90670493e-02,
            -7.93587938e-02,  -5.13139293e-02,   2.63874030e+00], dtype=float32)



The following block of code illustrates how to evaluate a single sequence. Additionally we show how one can pass in the information using NumPy arrays.


```python
# load dictionaries
query_wl = [line.rstrip('\n') for line in open(data['query']['file'])]
slots_wl = [line.rstrip('\n') for line in open(data['slots']['file'])]
query_dict = {query_wl[i]:i for i in range(len(query_wl))}
slots_dict = {slots_wl[i]:i for i in range(len(slots_wl))}

# let's run a sequence through
seq = 'BOS flights from new york to seattle EOS'
w = [query_dict[w] for w in seq.split()] # convert to word indices
print(w)
onehot = np.zeros([len(w),len(query_dict)], np.float32)
for t in range(len(w)):
    onehot[t,w[t]] = 1

#x = C.sequence.input_variable(vocab_size)
pred = z(x).eval({x:[onehot]})[0]
print(pred.shape)
best = np.argmax(pred,axis=1)
print(best)
list(zip(seq.split(),[slots_wl[s] for s in best]))
```

    [178, 429, 444, 619, 937, 851, 752, 179]
    (8, 129)
    [128 128 128  48 110 128  78 128]





    [('BOS', 'O'),
     ('flights', 'O'),
     ('from', 'O'),
     ('new', 'B-fromloc.city_name'),
     ('york', 'I-fromloc.city_name'),
     ('to', 'O'),
     ('seattle', 'B-toloc.city_name'),
     ('EOS', 'O')]




```python
seq = 'BOS i want round trip flights from new york to toronto EOS'
w = [query_dict[w] for w in seq.split()] # convert to word indices
print(w)
onehot = np.zeros([len(w),len(query_dict)], np.float32)
for t in range(len(w)):
    onehot[t,w[t]] = 1

#x = C.sequence.input_variable(vocab_size)
pred = z(x).eval({x:[onehot]})[0]
print(pred.shape)
best = np.argmax(pred,axis=1)
print(best)
list(zip(seq.split(),[slots_wl[s] for s in best]))
```

    [178, 479, 902, 730, 870, 429, 444, 619, 937, 851, 856, 179]
    (12, 129)
    [128 128 128  66 119 128 128  48 110 128  78 128]





    [('BOS', 'O'),
     ('i', 'O'),
     ('want', 'O'),
     ('round', 'B-round_trip'),
     ('trip', 'I-round_trip'),
     ('flights', 'O'),
     ('from', 'O'),
     ('new', 'B-fromloc.city_name'),
     ('york', 'I-fromloc.city_name'),
     ('to', 'O'),
     ('toronto', 'B-toloc.city_name'),
     ('EOS', 'O')]




```python
query_dict['paris'] = 943
#print(sorted(query_dict.values()))
#print(len(slots_wl))
slots_wl.append('Unknown')
seq = 'BOS flights from new york to paris EOS'
w = [query_dict[w] for w in seq.split()] # convert to word indices
print(w)
onehot = np.zeros([len(w),len(query_dict)], np.float32)
for t in range(len(w)):
    onehot[t,w[t]] = 1

#x = C.sequence.input_variable(vocab_size)
pred = z(x).eval({x:[onehot]})[0]
print(pred.shape)
best = np.argmax(pred,axis=1)
print(best)
list(zip(seq.split(),[slots_wl[s] for s in best]))
```

    [178, 429, 444, 619, 937, 851, 943, 179]



    ---------------------------------------------------------------------------

    ValueError                                Traceback (most recent call last)

    <ipython-input-55-87f390ff70bd> in <module>()
         11 
         12 #x = C.sequence.input_variable(vocab_size)
    ---> 13 pred = z(x).eval({x:[onehot]})[0]
         14 print(pred.shape)
         15 best = np.argmax(pred,axis=1)


    /anaconda/envs/py35/lib/python3.5/site-packages/cntk/ops/functions.py in eval(self, arguments, outputs, device, as_numpy)
        624             outputs = self.outputs
        625 
    --> 626         _, output_map = self.forward(arguments, outputs, device=device, as_numpy=as_numpy)
        627         return sanitize_variable_value_dict(output_map)
        628 


    /anaconda/envs/py35/lib/python3.5/site-packages/cntk/internal/swig_helper.py in wrapper(*args, **kwds)
         67     @wraps(f)
         68     def wrapper(*args, **kwds):
    ---> 69         result = f(*args, **kwds)
         70         map_if_possible(result)
         71         return result


    /anaconda/envs/py35/lib/python3.5/site-packages/cntk/ops/functions.py in forward(self, arguments, outputs, keep_for_backward, device, as_numpy)
        748 
        749         in_var_map = sanitize_var_map(self.arguments, arguments,
    --> 750                                       None, device)
        751         if outputs is None:
        752             outputs = self.outputs


    /anaconda/envs/py35/lib/python3.5/site-packages/cntk/internal/sanitize.py in sanitize_var_map(op_arguments, arguments, precision, device, extract_values_from_minibatch_data)
        429 
        430         if not (isinstance(batch, MinibatchData) or isinstance(batch, cntk_py.Value)):
    --> 431             batch = sanitize_batch(var, batch, seq_starts, device)
        432 
        433         var_map[var] = batch


    /anaconda/envs/py35/lib/python3.5/site-packages/cntk/internal/swig_helper.py in wrapper(*args, **kwds)
         67     @wraps(f)
         68     def wrapper(*args, **kwds):
    ---> 69         result = f(*args, **kwds)
         70         map_if_possible(result)
         71         return result


    /anaconda/envs/py35/lib/python3.5/site-packages/cntk/internal/sanitize.py in sanitize_batch(var, batch, seq_starts, device)
        198 
        199     from .. import Value
    --> 200     return Value.create(var, batch, seq_starts, device)
        201 
        202 


    /anaconda/envs/py35/lib/python3.5/site-packages/cntk/internal/swig_helper.py in wrapper(*args, **kwds)
         67     @wraps(f)
         68     def wrapper(*args, **kwds):
    ---> 69         result = f(*args, **kwds)
         70         map_if_possible(result)
         71         return result


    /anaconda/envs/py35/lib/python3.5/site-packages/cntk/core.py in create(var, data, seq_starts, device, read_only)
        454             device,
        455             read_only,
    --> 456             True)  # always create a copy in Value
        457 
        458         return value


    ValueError: Value::Create: The shape '[8 x 944]' of sequence #0 is not compatible with the sample shape '[943]'.
    
    [CALL STACK]
    [0x7f3a54e7a41c]                                                       + 0x64c41c
    [0x7f3a54f52e56]    CNTK::Value::  Create  (CNTK::NDShape const&,  std::vector<std::shared_ptr<CNTK::NDArrayView>,std::allocator<std::shared_ptr<CNTK::NDArrayView>>> const&,  std::vector<bool,std::allocator<bool>> const&,  CNTK::DeviceDescriptor const&,  bool,  bool) + 0xc56
    [0x7f3a558f990e]                                                       + 0x24390e
    [0x7f3a558fbd0d]                                                       + 0x245d0d
    [0x7f3a80d0a5e9]    PyCFunction_Call                                   + 0xf9
    [0x7f3a80d91bd5]    PyEval_EvalFrameEx                                 + 0x8fb5
    [0x7f3a80d92b49]                                                       + 0x144b49
    [0x7f3a80d92cd8]    PyEval_EvalCodeEx                                  + 0x48
    [0x7f3a80ce8661]                                                       + 0x9a661
    [0x7f3a80cb5236]    PyObject_Call                                      + 0x56
    [0x7f3a80d8f234]    PyEval_EvalFrameEx                                 + 0x6614
    [0x7f3a80d92b49]                                                       + 0x144b49
    [0x7f3a80d91df5]    PyEval_EvalFrameEx                                 + 0x91d5
    [0x7f3a80d92b49]                                                       + 0x144b49
    [0x7f3a80d92cd8]    PyEval_EvalCodeEx                                  + 0x48
    [0x7f3a80ce8661]                                                       + 0x9a661
    [0x7f3a80cb5236]    PyObject_Call                                      + 0x56
    [0x7f3a80d8f234]    PyEval_EvalFrameEx                                 + 0x6614
    [0x7f3a80d92b49]                                                       + 0x144b49
    [0x7f3a80d91df5]    PyEval_EvalFrameEx                                 + 0x91d5
    [0x7f3a80d92b49]                                                       + 0x144b49
    [0x7f3a80d91df5]    PyEval_EvalFrameEx                                 + 0x91d5
    [0x7f3a80d92b49]                                                       + 0x144b49
    [0x7f3a80d92cd8]    PyEval_EvalCodeEx                                  + 0x48
    [0x7f3a80ce8661]                                                       + 0x9a661
    [0x7f3a80cb5236]    PyObject_Call                                      + 0x56
    [0x7f3a80d8f234]    PyEval_EvalFrameEx                                 + 0x6614
    [0x7f3a80d92b49]                                                       + 0x144b49
    [0x7f3a80d91df5]    PyEval_EvalFrameEx                                 + 0x91d5
    [0x7f3a80d92b49]                                                       + 0x144b49
    [0x7f3a80d91df5]    PyEval_EvalFrameEx                                 + 0x91d5
    [0x7f3a80d92b49]                                                       + 0x144b49
    [0x7f3a80d92cd8]    PyEval_EvalCodeEx                                  + 0x48
    [0x7f3a80d92d1b]    PyEval_EvalCode                                    + 0x3b
    [0x7f3a80d85dfe]                                                       + 0x137dfe
    [0x7f3a80d0a5e9]    PyCFunction_Call                                   + 0xf9
    [0x7f3a80d91bd5]    PyEval_EvalFrameEx                                 + 0x8fb5
    [0x7f3a80d92b49]                                                       + 0x144b49
    [0x7f3a80d91df5]    PyEval_EvalFrameEx                                 + 0x91d5
    [0x7f3a80d92b49]                                                       + 0x144b49
    [0x7f3a80d91df5]    PyEval_EvalFrameEx                                 + 0x91d5
    [0x7f3a80d92b49]                                                       + 0x144b49
    [0x7f3a80d92cd8]    PyEval_EvalCodeEx                                  + 0x48
    [0x7f3a80ce8661]                                                       + 0x9a661
    [0x7f3a80cb5236]    PyObject_Call                                      + 0x56
    [0x7f3a80d8f234]    PyEval_EvalFrameEx                                 + 0x6614
    [0x7f3a80d92b49]                                                       + 0x144b49
    [0x7f3a80d91df5]    PyEval_EvalFrameEx                                 + 0x91d5
    [0x7f3a80d92b49]                                                       + 0x144b49
    [0x7f3a80d91df5]    PyEval_EvalFrameEx                                 + 0x91d5
    [0x7f3a80d92166]    PyEval_EvalFrameEx                                 + 0x9546 (x2)
    [0x7f3a80d92b49]                                                       + 0x144b49
    [0x7f3a80d92cd8]    PyEval_EvalCodeEx                                  + 0x48
    [0x7f3a80ce8661]                                                       + 0x9a661
    [0x7f3a80cb5236]    PyObject_Call                                      + 0x56
    [0x7f3a80d8f234]    PyEval_EvalFrameEx                                 + 0x6614
    [0x7f3a80d92b49]                                                       + 0x144b49
    [0x7f3a80d92cd8]    PyEval_EvalCodeEx                                  + 0x48
    [0x7f3a80ce8661]                                                       + 0x9a661
    [0x7f3a80cb5236]    PyObject_Call                                      + 0x56
    [0x7f3a80d8f234]    PyEval_EvalFrameEx                                 + 0x6614
    [0x7f3a80d92b49]                                                       + 0x144b49
    [0x7f3a80d91df5]    PyEval_EvalFrameEx                                 + 0x91d5
    [0x7f3a80d92166]    PyEval_EvalFrameEx                                 + 0x9546
    [0x7f3a80d92b49]                                                       + 0x144b49
    [0x7f3a80d92cd8]    PyEval_EvalCodeEx                                  + 0x48
    [0x7f3a80ce8661]                                                       + 0x9a661
    [0x7f3a80cb5236]    PyObject_Call                                      + 0x56
    [0x7f3a80d8f234]    PyEval_EvalFrameEx                                 + 0x6614
    [0x7f3a80d92b49]                                                       + 0x144b49
    [0x7f3a80d91df5]    PyEval_EvalFrameEx                                 + 0x91d5
    [0x7f3a80d92166]    PyEval_EvalFrameEx                                 + 0x9546
    [0x7f3a80d92b49]                                                       + 0x144b49
    [0x7f3a80d91df5]    PyEval_EvalFrameEx                                 + 0x91d5
    [0x7f3a80d92166]    PyEval_EvalFrameEx                                 + 0x9546
    [0x7f3a80d92b49]                                                       + 0x144b49
    [0x7f3a80d91df5]    PyEval_EvalFrameEx                                 + 0x91d5
    [0x7f3a80d92b49]                                                       + 0x144b49
    [0x7f3a80d92cd8]    PyEval_EvalCodeEx                                  + 0x48
    [0x7f3a80d92d1b]    PyEval_EvalCode                                    + 0x3b
    [0x7f3a80d85dfe]                                                       + 0x137dfe
    [0x7f3a80d0a5e9]    PyCFunction_Call                                   + 0xf9
    [0x7f3a80d91bd5]    PyEval_EvalFrameEx                                 + 0x8fb5
    [0x7f3a80d92b49]                                                       + 0x144b49
    [0x7f3a80d91df5]    PyEval_EvalFrameEx                                 + 0x91d5
    [0x7f3a80d92b49]                                                       + 0x144b49
    [0x7f3a80d92cd8]    PyEval_EvalCodeEx                                  + 0x48
    [0x7f3a80ce8542]                                                       + 0x9a542
    [0x7f3a80cb5236]    PyObject_Call                                      + 0x56
    [0x7f3a80dd38a2]                                                       + 0x1858a2
    [0x7f3a80dd4565]    Py_Main                                            + 0x945
    [0x400add]          main                                               + 0x15d
    [0x7f3a7fd6f830]    __libc_start_main                                  + 0xf0
    [0x4008b9]                                                            



### A Word About [`Sequential()`](https://www.cntk.ai/pythondocs/layerref.html#sequential)

Before jumping to the tasks, let's have a look again at the model we just ran.
The model is described in what we call *function-composition style*.
```python
        Sequential([
            Embedding(emb_dim),
            Recurrence(LSTM(hidden_dim), go_backwards=False),
            Dense(num_labels)
        ])
```
You may be familiar with the "sequential" notation from other neural-network toolkits.
If not, [`Sequential()`](https://www.cntk.ai/pythondocs/layerref.html#sequential) is a powerful operation that,
in a nutshell, allows to compactly express a very common situation in neural networks
where an input is processed by propagating it through a progression of layers.
`Sequential()` takes an list of functions as its argument,
and returns a *new* function that invokes these functions in order,
each time passing the output of one to the next.
For example,
```python
	FGH = Sequential ([F,G,H])
    y = FGH (x)
```
means the same as
```
    y = H(G(F(x))) 
```
This is known as ["function composition"](https://en.wikipedia.org/wiki/Function_composition),
and is especially convenient for expressing neural networks, which often have this form:

         +-------+   +-------+   +-------+
    x -->|   F   |-->|   G   |-->|   H   |--> y
         +-------+   +-------+   +-------+

Coming back to our model at hand, the `Sequential` expression simply
says that our model has this form:

         +-----------+   +----------------+   +------------+
    x -->| Embedding |-->| Recurrent LSTM |-->| DenseLayer |--> y
         +-----------+   +----------------+   +------------+

### Task 1: Add a Lookahead 

Our recurrent model suffers from a structural deficit:
Since the recurrence runs from left to right, the decision for a slot label
has no information about upcoming words. The model is a bit lopsided.
Your task will be to modify the model such that
the input to the recurrence consists not only of the current word, but also of the next one
(lookahead).

Your solution should be in function-composition style.
Hence, you will need to write a Python function that does the following:

* takes no input arguments
* creates a placeholder (sequence) variable
* computes the "next value" in this sequence using the `sequence.future_value()` operation and
* concatenates the current and the next value into a vector of twice the embedding dimension using `splice()`

and then insert this function into `Sequential()`'s list right after the embedding layer.


```python
# Your task: Add lookahead
def create_model():
    with C.layers.default_options(initial_state=0.1):
        return C.layers.Sequential([
            C.layers.Embedding(emb_dim),
            C.layers.Recurrence(C.layers.LSTM(hidden_dim), go_backwards=False),
            C.layers.Dense(num_labels)
        ])
    
# Enable these when done:
#z = create_model()
#do_train_test()

```

### Task 2: Bidirectional Recurrent Model

Aha, knowledge of future words help. So instead of a one-word lookahead,
why not look ahead until all the way to the end of the sentence, through a backward recurrence?
Let us create a bidirectional model!

Your task is to implement a new layer that
performs both a forward and a backward recursion over the data, and
concatenates the output vectors.

Note, however, that this differs from the previous task in that
the bidirectional layer contains learnable model parameters.
In function-composition style,
the pattern to implement a layer with model parameters is to write a *factory function*
that creates a *function object*.

A function object, also known as [*functor*](https://en.wikipedia.org/wiki/Function_object), is an object that is both a function and an object.
Which means nothing else that it contains data yet still can be invoked as if it was a function.

For example, `Dense(outDim)` is a factory function that returns a function object that contains
a weight matrix `W`, a bias `b`, and another function to compute 
`input @ W + b.` (This is using 
[Python 3.5 notation for matrix multiplication](https://docs.python.org/3/whatsnew/3.5.html#whatsnew-pep-465).
In Numpy syntax it is `input.dot(W) + b`).
E.g. saying `Dense(1024)` will create this function object, which can then be used
like any other function, also immediately: `Dense(1024)(x)`. 

Let's look at an example for further clarity: Let us implement a new layer that combines
a linear layer with a subsequent batch normalization. 
To allow function composition, the layer needs to be realized as a factory function,
which could look like this:

```python
def DenseLayerWithBN(dim):
    F = Dense(dim)
    G = BatchNormalization()
    x = placeholder()
    apply_x = G(F(x))
    return apply_x
```

Invoking this factory function will create `F`, `G`, `x`, and `apply_x`. In this example, `F` and `G` are function objects themselves, and `apply_x` is the function to be applied to the data.
Thus, e.g. calling `DenseLayerWithBN(1024)` will
create an object containing a linear-layer function object called `F`, a batch-normalization function object `G`,
and `apply_x` which is the function that implements the actual operation of this layer
using `F` and `G`. It will then return `apply_x`. To the outside, `apply_x` looks and behaves
like a function. Under the hood, however, `apply_x` retains access to its specific instances of `F` and `G`.

Now back to our task at hand. You will now need to create a factory function,
very much like the example above.
You shall create a factory function
that creates two recurrent layer instances (one forward, one backward), and then defines an `apply_x` function
which applies both layer instances to the same `x` and concatenate the two results.

Alright, give it a try! To know how to realize a backward recursion in CNTK,
please take a hint from how the forward recursion is done.
Please also do the following:
* remove the one-word lookahead you added in the previous task, which we aim to replace; and
* make sure each LSTM is using `hidden_dim//2` outputs to keep the total number of model parameters limited.


```python
# Your task: Add bidirectional recurrence
def create_model():
    with C.layers.default_options(initial_state=0.1):  
        return C.layers.Sequential([
            C.layers.Embedding(emb_dim),
            C.layers.Recurrence(C.layers.LSTM(hidden_dim), go_backwards=False),
            C.layers.Dense(num_labels)
        ])

# Enable these when done:
#z = create_model()
#do_train_test()

```

Works like a charm! This model achieves 0.32%, better than the lookahead model above.
The bidirectional model has 40% less parameters than the lookahead one. However, if you go back and look closely
you may find that the lookahead one trained about 30% faster.
This is because the lookahead model has both less horizontal dependencies (one instead of two
recurrences) and larger matrix products, and can thus achieve higher parallelism.
