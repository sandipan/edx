import nltk
import sys
import os
import string
import math

FILE_MATCHES = 1
SENTENCE_MATCHES = 1


def main():

    # Check command-line arguments
    if len(sys.argv) != 2:
        sys.exit("Usage: python questions.py corpus")

    # Calculate IDF values across files
    files = load_files(sys.argv[1])
    file_words = {
        filename: tokenize(files[filename])
        for filename in files
    }
    file_idfs = compute_idfs(file_words)

    # Prompt user for query
    query = set(tokenize(input("Query: ")))

    # Determine top file matches according to TF-IDF
    filenames = top_files(query, file_words, file_idfs, n=FILE_MATCHES)

    # Extract sentences from top files
    sentences = dict()
    for filename in filenames:
        for passage in files[filename].split("\n"):
            for sentence in nltk.sent_tokenize(passage):
                tokens = tokenize(sentence)
                if tokens:
                    sentences[sentence] = tokens

    # Compute IDF values across sentences
    idfs = compute_idfs(sentences)

    # Determine top sentence matches
    matches = top_sentences(query, sentences, idfs, n=SENTENCE_MATCHES)
    for match in matches:
        print(match)


def load_files(directory):
    """
    Given a directory name, return a dictionary mapping the filename of each
    `.txt` file inside that directory to the file's contents as a string.
    """
    file_text = {}
    for filename in os.listdir(directory):
        if filename[-4:].lower() == '.txt':
           file_text[filename] = open(os.path.join(directory, filename), 'r', encoding="utf-8").read()
    return file_text
    #raise NotImplementedError


def tokenize(document):
    """
    Given a document (represented as a string), return a list of all of the
    words in that document, in order.

    Process document by coverting all words to lowercase, and removing any
    punctuation or English stopwords.
    """
    return list(filter(lambda w: (not w in string.punctuation) and (not w in nltk.corpus.stopwords.words("english")), nltk.word_tokenize(document.lower())))
    #raise NotImplementedError


def compute_idfs(documents):
    """
    Given a dictionary of `documents` that maps names of documents to a list
    of words, return a dictionary that maps words to their IDF values.

    Any word that appears in at least one of the documents should be in the
    resulting dictionary.
    """
    words = set()
    for document in documents:
        words.update(documents[document])
    idfs = dict()
    for word in words:
        f = sum(word in documents[document] for document in documents)
        idfs[word] = math.log(len(documents) / f)
    return idfs
    #raise NotImplementedError


def top_files(query, files, idfs, n):
    """
    Given a `query` (a set of words), `files` (a dictionary mapping names of
    files to a list of their words), and `idfs` (a dictionary mapping words
    to their IDF values), return a list of the filenames of the the `n` top
    files that match the query, ranked according to tf-idf.
    """
    scores = []
    for filename in files:
        score = 0
        for word in query:
            tf = len(list(filter(lambda w: w == word, files[filename])))
            score += tf * idfs.get(word, 0)
        scores.append((score, filename))
    scores.sort(key = lambda x: -x[0])
    return [item[1] for item in scores][:n]
    #raise NotImplementedError


def top_sentences(query, sentences, idfs, n):
    """
    Given a `query` (a set of words), `sentences` (a dictionary mapping
    sentences to a list of their words), and `idfs` (a dictionary mapping words
    to their IDF values), return a list of the `n` top sentences that match
    the query, ranked according to idf. If there are ties, preference should
    be given to sentences that have a higher query term density.
    """
    scores = []
    for sentence in sentences:
        qtd = len(list(filter(lambda w: w in query, sentences[sentence]))) / len(sentences[sentence])
        score = 0
        for word in query:
            if word in sentences[sentence]:
               score += idfs.get(word, 0)
        scores.append((score, qtd, sentence)) 
    scores.sort(key = lambda x: (-x[0], -x[1]))
    #for score in scores[:5]:
    #    print('sentence: {}, score: {}, qtdensity: {}, idfs: '.format(score[2], score[0], score[1]) + str({w:round(idfs[w], 6) for w in sentences[score[2]] if w in query}))
    return [item[2] for item in scores][:n]
    #raise NotImplementedError


if __name__ == "__main__":
    main()
