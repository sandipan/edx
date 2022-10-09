import sys
import os.path
import numpy as np

import util

USAGE = "%s <test data folder> <spam folder> <ham folder>"

def get_counts(file_list):
    """
    Computes counts for each word that occurs in the files in file_list.

    Inputs
    ------
    file_list : a list of filenames, suitable for use with open() or 
                util.get_words_in_file()

    Output
    ------
    A dict whose keys are words, and whose values are the number of files the
    key occurred in.
    """
    ### TODO: Comment out the following line and write your code here
    from collections import Counter
    counter = Counter()
    for filename in file_list:
        words = list(set(util.get_words_in_file(filename))) # each word is a binary feature in BOW
        counter.update(words)

    #raise NotImplementedError
    return dict(counter)

def get_log_probabilities(file_list):
    """
    Computes log-frequencies for each word that occurs in the files in 
    file_list.

    Input
    -----
    file_list : a list of filenames, suitable for use with open() or 
                util.get_words_in_file()

    Output
    ------
    A dict whose keys are words, and whose values are the log of the smoothed
    estimate of the fraction of files the key occurred in.

    Hint
    ----
    The data structure util.DefaultDict will be useful to you here, as will the
    get_counts() helper above.
    """
    ### TODO: Comment out the following line and write your code here
    #raise NotImplementedError
    counts = get_counts(file_list)
    from collections import defaultdict
    my_dict = {word:np.log((counts[word]+1.)/(len(file_list)+2.)) for word in counts}
    return defaultdict(lambda:-np.log(len(file_list)+2.), my_dict)
    
def learn_distributions(file_lists_by_category):
    """
    Input
    -----
    A two-element list. The first element is a list of spam files, 
    and the second element is a list of ham (non-spam) files.

    Output
    ------
    (log_probabilities_by_category, log_prior)

    log_probabilities_by_category : A list whose first element is a smoothed
                                    estimate for log P(y=w_j|c=spam) (as a dict,
                                    just as in get_log_probabilities above), and
                                    whose second element is the same for c=ham.

    log_prior_by_category : A list of estimates for the log-probabilities for
                            each class:
                            [est. for log P(c=spam), est. for log P(c=ham)]
    """
    ### TODO: Comment out the following line and write your code here
    #raise NotImplementedError
    spam_files, ham_files = file_lists_by_category
    ps = get_log_probabilities(ham_files) 
    qs = get_log_probabilities(spam_files) 
    s = (len(spam_files) + 0.) / (len(ham_files) + len(spam_files) + 0.) # dont smooth
    return ([qs, ps], [np.log(s), np.log(1-s)])
    
def classify_email(email_filename,
                   log_probabilities_by_category,
                   log_prior_by_category):
    """
    Uses Naive Bayes classification to classify the email in the given file.

    Inputs
    ------
    email_filename : name of the file containing the email to be classified

    log_probabilities_by_category : See output of learn_distributions

    log_prior_by_category : See output of learn_distributions

    Output
    ------
    One of the labels in names.
    """
    ### TODO: Comment out the following line and write your code here
    #return 'spam'
    words = list(set(util.get_words_in_file(email_filename)))
    logs, log_1_s =  log_prior_by_category
    qs, ps = log_probabilities_by_category
    #print min([1-np.exp(qs.get(w)) for w in (set(qs.keys())-set(words))])
    spam_sup = logs + sum([qs[w] for w in words]) +  sum([np.log(1-np.exp(qs[w])) for w in (set(qs.keys())-set(words))])
    ham_sup = log_1_s + sum([ps[w] for w in words]) +  sum([np.log(1-np.exp(ps[w])) for w in (set(ps.keys())-set(words))])
    #print spam_sup, ham_sup
    return 'spam' if spam_sup >= ham_sup else 'ham'

def classify_emails(spam_files, ham_files, test_files):
    # DO NOT MODIFY -- used by the autograder
    log_probabilities_by_category, log_prior = \
        learn_distributions([spam_files, ham_files])
    estimated_labels = []
    for test_file in test_files:
        estimated_label = \
            classify_email(test_file, log_probabilities_by_category, log_prior)
        estimated_labels.append(estimated_label)
    return estimated_labels

def main():
    ### Read arguments
    if len(sys.argv) != 4:
        print USAGE % sys.argv[0]
    testing_folder = sys.argv[1]
    (spam_folder, ham_folder) = sys.argv[2:4]

    ### Learn the distributions
    file_lists = []
    for folder in (spam_folder, ham_folder):
        file_lists.append(util.get_files_in_folder(folder))
    (log_probabilities_by_category, log_priors_by_category) = \
            learn_distributions(file_lists)

    # Here, columns and rows are indexed by 0 = 'spam' and 1 = 'ham'
    # rows correspond to true label, columns correspond to guessed label
    performance_measures = np.zeros([2,2])

    ### Classify and measure performance
    for filename in (util.get_files_in_folder(testing_folder)):
        ## Classify
        label = classify_email(filename,
                               log_probabilities_by_category,
                               log_priors_by_category)
        ## Measure performance
        # Use the filename to determine the true label
        base = os.path.basename(filename)
        true_index = int('ham' in base)
        guessed_index = int(label == 'ham')#.find(True)
        performance_measures[true_index, guessed_index] += 1

        # Uncomment this line to see which files your classifier
        # gets right/wrong:
        #print("%s : %s" %(label, filename))

    template="You correctly classified %d out of %d spam emails, and %d out of %d ham emails."
    # Correct counts are on the diagonal
    correct = np.diag(performance_measures)
    # totals are obtained by summing across guessed labels
    totals = np.sum(performance_measures, 1)
    print(template % (correct[0],
                      totals[0],
                      correct[1],
                      totals[1]))
    
    ss, tps, tns, fps, fns, precs, recs, f1s, accs = [], [], [], [], [], [], [], [], []
    s = np.exp(log_priors_by_category[0])
    #ss += [s]    
    tp, tn, fp, fn = correct[0], correct[1], totals[1]-correct[1], totals[0]-correct[0]
    prec, rec, f1, acc =  tp / (tp + fp + 0.), tp / (tp + fn + 0.), 2.*tp / (2.*tp + fp + fn), (tp + tn) / (tp + fp + tn + fn + 0.)
    print 's', s
    print 'TP', tp
    print 'TN', tn
    print 'FP', fp
    print 'FN', fn
    print 'PREC', prec
    print 'REC', rec
    print 'F1', f1
    print 'ACC', acc
    #tps += [tp]
    #fps += [fp]
    #tns += [tn]
    #fns += [fn]
    #precs += [prec]
    #recs += [rec]
    #f1s += [f1]
    #accs += [acc]

    for s in [0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 0.99999]:
        
        performance_measures = np.zeros([2,2])

        log_priors_by_category = [np.log(s), np.log(1-s)]
        ### Classify and measure performance
        for filename in (util.get_files_in_folder(testing_folder)):
            ## Classify
            label = classify_email(filename,
                                   log_probabilities_by_category,
                                   log_priors_by_category)
            ## Measure performance
            # Use the filename to determine the true label
            base = os.path.basename(filename)
            true_index = int('ham' in base)
            guessed_index = int(label == 'ham')#.find(True)
            performance_measures[true_index, guessed_index] += 1

        template="You correctly classified %d out of %d spam emails, and %d out of %d ham emails."
        # Correct counts are on the diagonal
        correct = np.diag(performance_measures)
        # totals are obtained by summing across guessed labels
        totals = np.sum(performance_measures, 1)
        print(template % (correct[0],
                          totals[0],
                          correct[1],
                          totals[1]))
        ss += [s]    
        tp, tn, fp, fn = correct[0], correct[1], totals[1]-correct[1], totals[0]-correct[0]
        prec, rec, f1, acc =  tp / (tp + fp + 0.), tp / (tp + fn + 0.), 2.*tp / (2.*tp + fp + fn), (tp + tn) / (tp + fp + tn + fn + 0.)
        print 's', s
        print 'TP', tp
        print 'TN', tn
        print 'FP', fp
        print 'FN', fn
        print 'PREC', prec
        print 'REC', rec
        print 'F1', f1
        print 'ACC', acc
        tps += [tp]
        fps += [fp]
        tns += [tn]
        fns += [fn]
        precs += [prec]
        recs += [rec]
        f1s += [f1]
        accs += [acc]
        
    '''    
    import plotly.plotly as py
    import plotly.graph_objs as go
    trace1 = go.Scatter(
    x = ss,
    y = fp,
    mode = 'lines+markers',
    name = 'lines+markers'
    )
    trace2 = go.Scatter(
    x = ss,
    y = tp,
    mode = 'lines+markers',
    name = 'lines+markers'
    )
    data = [trace1, trace2]
    py.iplot(data, filename='scatter-mode')
    '''
    print fps
    
    import matplotlib.pyplot as plt
    
    plt.gca().set_color_cycle(['red', 'green', 'blue', 'yellow'])
    
    plt.ylim([0, 55])
    plt.plot(ss, fps, '-o')
    plt.plot(ss, tps, '-o')
    plt.plot(ss, fns, '-o')
    plt.plot(ss, tns, '-o')
    
    plt.legend(['FPs', 'TPs', 'FNs', 'TNs'], loc='upper left')
    plt.xlabel('Spam Prior (s)')
    plt.ylabel('Naive Bayes Classifier Performance')
    plt.show()
    
    plt.ylim([0, 1])
    plt.plot(ss, precs, '-o')
    plt.plot(ss, recs, '-o')
    plt.plot(ss, f1s, '-o')
    plt.plot(ss, accs, '-o')
    
    plt.legend(['Precision', 'Recall', 'F1', 'Accuracy'], loc='upper left')
    plt.xlabel('Spam Prior (s)')
    plt.ylabel('Naive Bayes Classifier Performance')
    plt.show()
    
if __name__ == '__main__':
    main()
