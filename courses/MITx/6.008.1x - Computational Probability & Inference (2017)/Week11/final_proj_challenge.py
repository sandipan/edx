import numpy as np
from sklearn import svm
from sklearn.ensemble import RandomForestClassifier, AdaBoostClassifier, GradientBoostingClassifier
from sklearn.tree import DecisionTreeClassifier
    


def get_labeled_windowed_data(observations, window_size=7):
    """
    Split up the observations into windowed chunks. Each windowed chunk of
    observations is associated with a label vector of what the price change is
    per market *immediately after* the windowed chunk (+1 for price goes up,
    0 for no change, and -1 for price goes down). Thus, a classifier's task
    for the data is given a windowed chunk, to predict what its label is
    (i.e., given recent percent changes in all the markets, predict the
    directions of the next price changes per market).

    Inputs
    ------
    - observations: 2D array; each column is a percent-change time series data
        for a specific market
    - window_size: how large the window is (in number of time points)

    Outputs
    -------
    - windows: 3D array; each element of the outermost array is a 2D array
        of the same format as `observations` except where the number of time
        points is exactly `window_size`
    - window_labels: 2D array; `window_labels[i]` is a 1D vector of labels
        corresponding to the time point *after* the window specified by
        `windows[i]`; `window_labels[i]` says what the price change is for
        each market (+1 for going up, 0 for staying the same, and -1 for going
        down)

    *WARNING*: Note that the training data produced here is inherently not
    i.i.d. in that `windows[0]` and `windows[1]`, for instance, will largely
    overlap!
    """
    num_time_points, num_markets = observations.shape
    windows = []
    window_labels = []
    for start_idx in range(num_time_points-window_size):
        windows.append(observations[start_idx:start_idx+window_size])
        window_labels.append(1*(observations[start_idx+window_size] > 0)
                             -1*(observations[start_idx+window_size] < 0))
    windows = np.array(windows)
    window_labels = np.array(window_labels)
    return windows, window_labels


# global variables to be saved for the trained classifier
clfs = None
clfs1 = None

def train(windows, window_labels):
    """
    Your training procedure goes here! It should train a classifier where you
    store whatever you want to store for the trained classifier as *global*
    variables. `train` will get called exactly once on the exact same training
    data you have access to. However, you will not get access to the mystery
    test data.

    Inputs
    ------
    - windows, window_labels: see the documentation for the output of
        `get_labeled_windowed_data`
    """

    # -------------------------------------------------------------------------
    # YOUR CODE HERE
    #

    # The autograder wants you to explicitly state which variables are global
    # and are supposed to thus be saved after training for use with prediction.
    global clfs, clfs1, clfs2

    #guess = 0

    #from sklearn.metrics import log_loss
    
    n, m = 7, 5
    X = np.concatenate((windows[:,-n:,0], windows[:,-n:,1], windows[:,-n:,2], windows[:,-n:,3]), axis=1)
    for i in range(4):
        for k in range(2,8):
            X = np.concatenate((X, ((windows[:,-k:,i] == 0).sum(axis=1)==k).reshape(X.shape[0],1)), axis=1)
            X = np.concatenate((X, ((windows[:,-k:,i] > 0).sum(axis=1)==k).reshape(X.shape[0],1)), axis=1)
            X = np.concatenate((X, ((windows[:,-k:,i] < 0).sum(axis=1)==k).reshape(X.shape[0],1)), axis=1)
            #X = np.concatenate((X, ((windows[:,-k:,1] == 0).sum(axis=1)==k).reshape(X.shape[0],1)), axis=1)
            #X = np.concatenate((X, ((windows[:,-k:,2] == 0).sum(axis=1)==k).reshape(X.shape[0],1)), axis=1)
            #X = np.concatenate((X, ((windows[:,-k:,3] == 0).sum(axis=1)==k).reshape(X.shape[0],1)), axis=1)
        X = np.concatenate((X, ((windows[:,-m:,i] == 0).sum(axis=1)).reshape(X.shape[0],1)), axis=1)
        X = np.concatenate((X, ((windows[:,-m:,i] > 0).sum(axis=1)).reshape(X.shape[0],1)), axis=1)
        #X = np.concatenate((X, ((windows[:,-m:,0] >= 0).sum(axis=1)).reshape(X.shape[0],1)), axis=1)
        X = np.concatenate((X, ((windows[:,-m:,i] < 0).sum(axis=1)).reshape(X.shape[0],1)), axis=1)

    clfs = [RandomForestClassifier(n_estimators=10) for i in range(4)]
    #clfs = [ AdaBoostClassifier(DecisionTreeClassifier(max_depth=1),
    #                     algorithm="SAMME",
    #                    n_estimators=20) for i in range(4)]
    clfs1 = [GradientBoostingClassifier(n_estimators=100, learning_rate=1.0, max_depth=1, random_state=0) for i in range(4)]
    clfs2 = [svm.SVC(C=10**6, kernel='rbf') for i in range(4)]
     
    for i in range(4):
       clfs[i] = clfs[i].fit(X, window_labels[:,i])
       clfs1[i] = clfs1[i].fit(X, window_labels[:,i])
       clfs2[i] = clfs2[i].fit(X, window_labels[:,i])
       #clf_probs = clf.predict_proba(X)
       #score = log_loss(y, clf_probs)
    #
    # END OF YOUR CODE
    # -------------------------------------------------------------------------


def forecast(window):
    """
    Your forecasting method goes here! You may assume that `train` has already
    been called on training data and so any global variables you stored as a
    result of running `train` are available to you here for prediction
    purposes.

    Input
    -----
    - window: 2D array; each column is 7 days worth of percent changes in
        price for a specific market

    Output
    ------
    1D array; the i-th entry is a prediction for whether the percentage
    return will go up (+1), stay the same (0), or go down (-1) for the i-th
    market
    """

    # -------------------------------------------------------------------------
    # YOUR CODE HERE
    #
    #from collections import Counter

    global clfs, clfs1, clfs2
    from scipy.stats import mode

    n, m = 7, 5
    X = window[-n:,:]
    X = X.flatten('F')
    for i in range(4):
        for k in range(2,8):
            X = np.append(X, (window[-k:,i] == 0).sum()==k)
            X = np.append(X, (window[-k:,i] > 0).sum()==k)
            X = np.append(X, (window[-k:,i] < 0).sum()==k)
            #X = np.append(X, (window[-k:,1] == 0).sum()==k)
            #X = np.append(X, (window[-k:,2] == 0).sum()==k)
            #X = np.append(X, (window[-k:,3] == 0).sum()==k)
        X = np.append(X, (window[-m:,i] == 0).sum())
        X = np.append(X, (window[-m:,i] > 0).sum())
        #X = np.append(X, (window[-m:,0] >= 0).sum())
        X = np.append(X, (window[-m:,i] < 0).sum())
    
    predicted_labels = np.array([mode([clfs[idx].predict(X), clfs1[idx].predict(X), clfs2[idx].predict(X)], axis=0).mode.flatten() for idx in range(window.shape[1])])
    
    #
    # END OF YOUR CODE
    # -------------------------------------------------------------------------

    return predicted_labels


def main():
    # get coconut oil challenge training data
    observations = []
    with open('coconut_challenge.csv', 'r') as f:
        for line in f.readlines():
            pieces = line.split(',')
            if len(pieces) == 5:
                observations.append([float(pieces[1]),
                                     float(pieces[2]),
                                     float(pieces[3]),
                                     float(pieces[4])])
    observations = np.array(observations)
    train_windows, train_window_labels = \
        get_labeled_windowed_data(observations, window_size=7)
    
    
    train(train_windows, train_window_labels)

    # figure out accuracy of the trained classifier on predicting labels for
    # the training data
    train_predictions = []
    for window, window_label in zip(train_windows, train_window_labels):
        train_predictions.append(forecast(window))
    train_predictions = np.array(train_predictions)

    train_prediction_accuracy_plus1 = \
        np.mean(train_predictions[train_window_labels == 1]
                == train_window_labels[train_window_labels == 1])
    train_prediction_accuracy_minus1 = \
        np.mean(train_predictions[train_window_labels == -1]
                == train_window_labels[train_window_labels == -1])
    train_prediction_accuracy_0 = \
        np.mean(train_predictions[train_window_labels == 0]
                == train_window_labels[train_window_labels == 0])
    print('Training accuracy for prediction +1:',
          train_prediction_accuracy_plus1)
    print('Training accuracy for prediction -1:',
          train_prediction_accuracy_minus1)
    print('Training accuracy for prediction 0:',
          train_prediction_accuracy_0)


if __name__ == '__main__':
    main()
