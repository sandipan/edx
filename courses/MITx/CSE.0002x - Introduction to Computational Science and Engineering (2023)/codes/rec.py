import tensorflow as tf
from tensorflow.keras.regularizers import L1, L2
from tensorflow.keras.optimizers import Adam

class DFM(tf.keras.Model):
    def __init__(self, n_users, n_items, emb_dim=32, layers_dims=[16, 16, 16], lambda_=1, keep_prob=1, regularization="L2"):
        """
        Implements the DFM (Deep Factorization Machine) architecture
        """
        super(DFM, self).__init__()
        # number of unique users and items
        self.n_users = n_users
        self.n_items = n_items

        # hyperparams
        self.lambda_ = lambda_
        self.drop_prob = 1 - keep_prob
        self.emb_dim = emb_dim
        self.layers_dims = layers_dims

        # regularization to use
        self.regularization = L2 if regularization == "L2" else L1

        # number of layers of DNN
        self.num_layers = len(layers_dims)

        # initialize embedding and embedding bias layers
        self.user_emb_layer = tf.keras.layers.Embedding(n_users, emb_dim, embeddings_regularizer=self.regularization(lambda_), name='user_embedding')
        self.item_emb_layer = tf.keras.layers.Embedding(n_items, emb_dim, embeddings_regularizer=self.regularization(lambda_), name='item_embedding')

        self.user_emb_bias_layer = tf.keras.layers.Embedding(n_users, 1, embeddings_initializer='zeros', name='user_embedding_bias')
        self.item_emb_bias_layer = tf.keras.layers.Embedding(n_items, 1, embeddings_initializer='zeros', name='item_embedding_bias')

        # initialize dot product layer and add layer for
        # embedding vectors and bias scalars respectively
        self.dot_layer = tf.keras.layers.Dot(axes=(2, 1))
        self.add_layer = tf.keras.layers.Add()

        # initialize flatten layer to flatten sum of the dot product
        # of user_emb & item_emb, user_emb_bias, and  item_emb_bias
        self.flatten_fact_matrix_layer = tf.keras.layers.Flatten()
        
        # initialize concat layer as input to DNN
        self.concat_layer = tf.keras.layers.Concatenate(axis=2)
        self.flatten_concat_emb_layer = tf.keras.layers.Flatten()

        # initialize dense and activation layers of DNN
        self.dense_layers, self.act_layers, self.dropout_layers = self.init_dense_act_drop_layers()

        # initialize last layer of DNN to dense with no activation
        self.last_dense_layer = tf.keras.layers.Dense(units=1, activation='linear', kernel_regularizer=self.regularization(lambda_))

        
        self.add_layer = tf.keras.layers.Add()

        # output layer will just be a sigmoid activation layer
        self.out_layer = tf.keras.layers.Activation(activation=tf.nn.sigmoid)
        

    def call(self, inputs, **kwargs): #training=False): #
        # catch inputs first since Model will be taking in a 2 rows of data
        # the user_id_input which is m x 1 and item_id_input which is m x 1
        # since one example would be one user and one item
        user_id_input = inputs[0]
        item_id_input = inputs[1]

        # DEFINE FORWARD PROPAGATION

        # once user_id_input is passed dimensionality goes from m x 1
        # to m x 1 x emb_dim
        user_emb = self.user_emb_layer(user_id_input)
        item_emb = self.item_emb_layer(item_id_input)

        user_emb_bias = self.user_emb_bias_layer(user_id_input)
        item_emb_bias = self.item_emb_bias_layer(item_id_input)

        # calculate the dot product of the user_emb and item_emb vectors
        user_item_dot = self.dot_layer([user_emb, tf.transpose(item_emb, perm=[0, 2, 1])])
        fact_matrix = self.add_layer([user_item_dot, user_emb_bias, item_emb_bias])
        fact_matrix_flat = self.flatten_fact_matrix_layer(fact_matrix)

        # concatenate the user_emb and item_emb vectors
        # then feed to fully connected deep neural net
        A = self.concat_layer([user_emb, item_emb])
        flat_A = self.flatten_concat_emb_layer(A)

        # forward propagate through deep neural network according to number of layers
        for l in range(self.num_layers):
            # pass concatenated user_embedding and item embedding 
            # to dense layer to calculate Z at layer l
            Z = self.dense_layers[l](flat_A)

            # activate output Z layer by passing to relu activation layer
            flat_A = self.act_layers[l](Z)
            #for key, value in kwargs.items(): 
            #    tf.print(f'{key} == {value}') 
            #tf.print(training)
            #if training:
            if kwargs['training'] == True:
                flat_A = self.dropout_layers[l](flat_A)

        # pass second to the last layer to a linear layer
        A_last = self.last_dense_layer(flat_A)

        # add the output to the flattened factorized matrix
        sum_ = self.add_layer([A_last, fact_matrix_flat])

        # pass the sum of last dense layer and the flattened 
        # factorized matrix to a sigmoid activation function
        out = self.out_layer(sum_)

        return out

    def init_dense_act_drop_layers(self):
        """
        
        """
        dense_layers = []
        act_layers = []
        dropout_layers = []

        layers_dims = self.layers_dims
        for layer_dim in layers_dims:
            dense_layers.append(tf.keras.layers.Dense(units=layer_dim, kernel_regularizer=self.regularization(self.lambda_)))
            act_layers.append(tf.keras.layers.Activation(activation=tf.nn.relu))

            # drop 1 - keep_prob percent of the neurons e.g. keep_prob
            # is 0.2 so drop 1 - 0.2 or 0.8/80% of the neurons at each 
            # activation layer
            dropout_layers.append(tf.keras.layers.Dropout(rate=self.drop_prob))


        return dense_layers, act_layers, dropout_layers
   
from tensorflow.keras.losses import BinaryCrossentropy as bce_loss
from tensorflow.keras.metrics import (BinaryAccuracy, 
    Precision,
    Recall,
    AUC,
    BinaryCrossentropy as bce_metric, 
)

n_users = 12033 
n_items = 4228 

model = DFM(
            n_users=n_users, 
            n_items=n_items, 
            emb_dim=64, #8,
            layers_dims=[256], #, 16],
            lambda_=0.01, #1.2, 
            keep_prob=0.8, #0.8, 
            regularization="L2")

model.compile(
    optimizer=Adam(learning_rate=1e-4), #0.0075),
    loss=bce_loss(),
    metrics=[bce_metric(), BinaryAccuracy(), Precision(), Recall(), AUC()] #, f1_m]
)


import numpy as np
import pandas as pd

N = 50000
rdf = pd.DataFrame({'user_id': np.random.choice(n_users, N, replace=True), 
                   'item_id': np.random.choice(n_items, N, replace=True),
                   'rating': np.random.choice(range(2), N, replace=True)})
print(rdf.head())

print(rdf['rating'].value_counts())

tf.random.shuffle(rdf)

train_data = rdf.loc[:45000]
cross_data = rdf.loc[45000:]
print(train_data.shape, cross_data.shape)

'''
# train model
history = model.fit(
    [train_data['user_id'], train_data['item_id']],
    train_data['rating'],
    batch_size=32768, #16384,
    epochs=100, #500,
    validation_data=([cross_data['user_id'], cross_data['item_id']], cross_data['rating']),
    verbose=1
)

#print(model.summary())
#tf.keras.utils.plot_model (model, to_file = 'model.png', show_shapes = True, show_layer_names = True)
'''