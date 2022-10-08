train_path = "aclImdb/train/" #"../resource/asnlib/public/aclImdb/train/" # use terminal to ls files under this directory
test_path = "imdb_te.csv" #"../resource/asnlib/public/imdb_te.csv" # test data for grade evaluation

import numpy as np
import pandas as pd
import os
import glob
from sklearn.feature_extraction.text import CountVectorizer
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.linear_model import SGDClassifier
from sklearn.feature_extraction import text 
from sklearn.metrics import hinge_loss
#import matplotlib.pylab as plt
#jet=plt.get_cmap('coolwarm')
from ggplot import *
import seaborn as sns

def imdb_data_preprocess(inpath, outpath="./", name="imdb_tr.csv", mix=False):
    '''Implement this module to extract
    and combine text files under train_path directory into 
    imdb_tr.csv. Each text file in train_path should be stored 
    as a row in imdb_tr.csv. And imdb_tr.csv should have two 
    columns, "text" and label'''
    train_df = pd.DataFrame()
    for dir_lab in ['pos', 'neg']:    
        tr_df = pd.DataFrame()
        train_files = glob.glob(train_path + "/" + dir_lab + "/*.txt")
        polarity = 1 if dir_lab == 'pos' else 0
        list_ = []
        for file_ in train_files:
            df = pd.DataFrame([open(file_, "r").read()]) #pd.read_csv(file_, header=None) #index_col=None, 
            df.columns = ["text"]
            df['polarity'] = polarity
            list_.append(df)
        tr_df = pd.concat(list_)
        train_df = train_df.append(tr_df, ignore_index=True)
    train_df.to_csv(outpath + name)
    
      
if __name__ == "__main__":
    
    if not os.path.exists("imdb_tr.csv"): imdb_data_preprocess(train_path)
    
    train_df = pd.read_csv("imdb_tr.csv")
    test_df = pd.read_csv(test_path)
    
    iters = [100] #np.linspace(5, 100, 20)
    ytest = []
    
    df = pd.DataFrame()
    
    hl = []
    for iter in iters:    
    
        clf = SGDClassifier(loss="hinge", penalty="l1", n_iter=iter, verbose=1)             #alpha=0.01, n_iter=200, fit_intercept=True)
        stop_words = text.ENGLISH_STOP_WORDS.union(open('stopwords.en.txt').read().splitlines())
    
        '''train a SGD classifier using unigram representation,
        predict sentiments on imdb_te.csv, and write output to
        unigram.output.txt'''
       
        vectorizer = CountVectorizer(min_df=1, stop_words=stop_words, decode_error='ignore') # 'english'
        X, y = vectorizer.fit_transform(train_df.text), train_df.polarity                    #.toarray() vectorizer.get_feature_names()
    
        Xtest = vectorizer.transform(test_df.text) #.toarray()
        
        # fit the model
        clf.fit(X, y)
        hl.append(hinge_loss(clf.predict(X),y))
        
        #ax = pd.DataFrame(clf.predict_proba(Xtest), columns=['positive', 'negative']).plot(kind='density', title ="Density plot of the predicted probabilities for Unigram", figsize=(15, 10), legend=True, fontsize=12)
        #ax.set_xlabel("Predicted Probability", fontsize=12)
        #ax.set_ylabel("Density", fontsize=12)
        #plt.savefig('sol/uni' + str(iter).zfill(3) + '.png') #, bbox_inches='tight')
        #plt.close()
     
        # predict
        ytest = clf.predict(Xtest)
        np.savetxt('unigram.output.txt', ytest.astype(int), fmt='%i') #open('unigram.output.txt', 'w').write("\n".join(ytest))
    
    sns.countplot(ytest)
    sns.plt.title('Prediction with Unigram Model')
    sns.plt.show()
    
    df1 = pd.DataFrame({'iter':iters, 'hinge_loss':hl, 'type':'Unigram'})
    df = df.append(df1)    
    
    '''train a SGD classifier using bigram representation,
    predict sentiments on imdb_te.csv, and write output to
    bigram.output.txt'''
    
    hl = []
    for iter in iters:    
    
        clf = SGDClassifier(loss="hinge", penalty="l1", n_iter=iter, verbose=1)             #alpha=0.01, n_iter=200, fit_intercept=True)
        vectorizer = CountVectorizer(ngram_range=(1, 2), token_pattern=r'\b\w+\b', min_df=1, stop_words=stop_words, decode_error='ignore')
        X, y = vectorizer.fit_transform(train_df.text), train_df.polarity 
        
        Xtest = vectorizer.transform(test_df.text)
    
        # fit the model
        clf.fit(X, y)
        hl.append(hinge_loss(clf.predict(X),y))
        
        #ax = pd.DataFrame(clf.predict_proba(Xtest), columns=['positive', 'negative']).plot(kind='density', title ="Density plot of the predicted probabilities for Bigram", figsize=(15, 10), legend=True, fontsize=12)
        #ax.set_xlabel("Predicted Probability", fontsize=12)
        #ax.set_ylabel("Density", fontsize=12)
        #plt.savefig('sol/bi' + str(iter).zfill(3) + '.png') #, bbox_inches='tight')
        #plt.close()
            
        # predict
        ytest = clf.predict(Xtest)
        np.savetxt('bigram.output.txt', ytest.astype(int), fmt='%i')

    #sns.distplot(ytest, bins = [0,1], kde=False)
    sns.countplot(ytest)
    sns.plt.title('Prediction with Bigram Model')
    sns.plt.show()

    df1 = pd.DataFrame({'iter':iters, 'hinge_loss':hl, 'type':'Bigram'})
    df = df.append(df1)        
     
    hl = []
    for iter in iters:    
    
        '''train a SGD classifier using unigram representation
        with tf-idf, predict sentiments on imdb_te.csv, and write 
        output to unigram.output.txt'''
        clf = SGDClassifier(loss="hinge", penalty="l1", n_iter=iter, verbose=1)             #alpha=0.01, n_iter=200, fit_intercept=True)
        vectorizer = TfidfVectorizer(min_df=1, stop_words=stop_words, sublinear_tf=True, decode_error='ignore')
        X, y = vectorizer.fit_transform(train_df.text), train_df.polarity 
        
        Xtest = vectorizer.transform(test_df.text)
    
        # fit the model
        clf.fit(X, y)
        hl.append(hinge_loss(clf.predict(X),y))

        #ax = pd.DataFrame(clf.predict_proba(Xtest), columns=['positive', 'negative']).plot(kind='density', title ="Density plot of the predicted probabilities for Unigram Tf-Idf", figsize=(15, 10), legend=True, fontsize=12)
        #ax.set_xlabel("Predicted Probability", fontsize=12)
        #ax.set_ylabel("Density", fontsize=12)
        #plt.savefig('sol/unitf' + str(iter).zfill(3) + '.png') #, bbox_inches='tight')
        #plt.close()
        
        # predict
        ytest = clf.predict(Xtest)
        np.savetxt('unigramtfidf.output.txt', ytest.astype(int), fmt='%i')
    
    sns.countplot(ytest)
    sns.plt.title('Prediction with Unigram TfIdf Model')
    sns.plt.show()

    df1 = pd.DataFrame({'iter':iters, 'hinge_loss':hl, 'type':'Unigram TfIdf'})
    df = df.append(df1)        

    '''train a SGD classifier using bigram representation
    with tf-idf, predict sentiments on imdb_te.csv, and write 
    output to unigram.output.txt'''
    
    hl = []
    for iter in iters:    
    
        clf = SGDClassifier(loss="hinge", penalty="l1", n_iter=iter, verbose=1)             #alpha=0.01, n_iter=200, fit_intercept=True)
        vectorizer = TfidfVectorizer(ngram_range=(1, 2), token_pattern=r'\b\w+\b', min_df=1, sublinear_tf=True, stop_words=stop_words, decode_error='ignore')
        X, y = vectorizer.fit_transform(train_df.text), train_df.polarity 
        
        Xtest = vectorizer.transform(test_df.text)
    
        # fit the model
        clf.fit(X, y)
        hl.append(hinge_loss(clf.predict(X),y))
        
        #ax = pd.DataFrame(clf.predict_proba(Xtest), columns=['positive', 'negative']).plot(kind='density', title ="Density plot of the predicted probabilities for Bigram Tf-Idf", figsize=(15, 10), legend=True, fontsize=12)
        #ax.set_xlabel("Predicted Probability", fontsize=12)
        #ax.set_ylabel("Density", fontsize=12)
        #plt.savefig('sol/bitf' + str(iter).zfill(3) + '.png') #, bbox_inches='tight')
        #plt.close()
       
        # predict
        ytest = clf.predict(Xtest)
        np.savetxt('bigramtfidf.output.txt', ytest.astype(int), fmt='%i')
        
    sns.countplot(ytest)
    sns.plt.title('Prediction with Bigram TfIdf Model')
    sns.plt.show()

    df1 = pd.DataFrame({'iter':iters, 'hinge_loss':hl, 'type':'Bigram TfIdf'})
    df = df.append(df1)        
 
    #plt.plot(iters, hl)
    #plt.title('hinge-loss with SGD with diffetrent #iterations')
    #plt.show()
     
    df.to_csv('results.csv')
    print ggplot(aes(x='iter', y='hinge_loss', colour='type'), data=df) + geom_line()

def convert_gl_to_csv():
    import sframe
    root = 'C:/courses/Coursera/Past/Specialization-UW Machine Learning/'
    path = 'ML Classification/Week3/' #'ML foundation/Deep Learning/' #'ML foundation/Recommender Systems/' #'ML foundation/Linear Regression Modeling/' #'ML foundation/Clustering/' #'ML foundation/Classification/'
    file_name = 'lending-club-data' #'amazon_baby_subset' #'image_test_data' #'song_data' #'home_data' #'people_wiki' #'amazon_baby'
    sf = sframe.SFrame(root + path + file_name + '.gl/') 
    sf.save(root + path + file_name + '.csv', format='csv')
