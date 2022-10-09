#!/usr/bin/env python
"""
movie_recommendations.py
Original author: Felix Sun (6.008 TA, Fall 2015)
Modified by:
- Danielle Pace (6.008 TA, Fall 2016),
- George H. Chen (6.008/6.008.1x instructor, Fall 2016)

Please read the project instructions beforehand! Your code should go in the
blocks denoted by "YOUR CODE GOES HERE" -- you should not need to modify any
other code!
"""

import matplotlib.pyplot as plt
import movie_data_helper
import numpy as np
import scipy
import scipy.misc
from sys import exit


def compute_posterior(prior, likelihood, y):
    """
    Use Bayes' rule for random variables to compute the posterior distribution
    of a hidden variable X, given N observations Y_0, Y_1, ..., Y_{N-1}.
    Conditioned on X, these observations Y_0, Y_1, ..., Y_{N-1} are i.i.d.

    Hidden random variable X is assumed to take on a value in {0, 1, ..., M-1}.

    Each random variable Y_i takes on a value in {0, 1, ..., K-1}.

    Inputs
    ------
    - prior: a length M vector stored as a 1D NumPy array; prior[m] gives the
        (unconditional) probability that X = m
    - likelihood: a K row by M column matrix stored as a 2D NumPy array;
        likelihood[k, m] gives the probability that Y = k given X = m
    - y: a length-N vector stored as a 1D NumPy array; y[n] gives the observed
        value for random variable Y_n

    Output
    ------
    - posterior: a length M vector stored as a 1D NumPy array: posterior[m]
        gives the probability that X = m given
        Y_0 = y_0, ..., Y_{N-1} = y_{n-1}
    """

    # -------------------------------------------------------------------------
    # ERROR CHECKS -- DO NOT MODIFY
    #

    # check that prior probabilities sum to 1
    if np.abs(1 - np.sum(prior)) > 1e-06:
        exit('In compute_posterior: The prior probabilities need to sum to 1')

    # check that likelihood is specified as a 2D array
    if len(likelihood.shape) != 2:
        exit('In compute_posterior: The likelihood needs to be specified as ' +
             'a 2D array')

    K, M = likelihood.shape

    # make sure likelihood and prior agree on number of hidden states
    if len(prior) != M:
        exit('In compute_posterior: Mismatch in number of hidden states ' +
             'according to the prior and the likelihood.')

    # make sure the conditional distribution given each hidden state value sums
    # to 1
    for m in range(M):
        if np.abs(1 - np.sum(likelihood[:, m])) > 1e-06:
            exit('In compute_posterior: P(Y | X = %d) does not sum to 1' % m)

    #
    # END OF ERROR CHECKS
    # -------------------------------------------------------------------------

    # -------------------------------------------------------------------------
    # YOUR CODE GOES HERE FOR PART (b)
    #
    # Place your code to compute the log of the posterior here: store it in a
    # NumPy array called `log_answer`. If you exponentiate really small
    # numbers, the result is likely to underflow (i.e., it will be so small
    # that the computer will just make it 0 rather than storing the right
    # value). You need to go to log-domain. Hint: this next line is a good
    # first step.

    log_answer = np.zeros(M)
    log_prior = np.log(prior)
    for m in range(M):
        ll = likelihood[y,m]
        log_likelihood = np.sum(np.log(ll[ll > 0]))
        log_answer[m] = log_prior[m] + log_likelihood
    Z = scipy.misc.logsumexp(log_answer)
    for m in range(M):
        log_answer[m] = log_answer[m] - Z

    #
    # END OF YOUR CODE FOR PART (b)
    # -------------------------------------------------------------------------

    # do not exponentiate before this step
    posterior = np.exp(log_answer)
    return posterior


def compute_movie_rating_likelihood(M):
    """
    Compute the rating likelihood probability distribution of Y given X where
    Y is an individual rating (takes on a value in {0, 1, ..., M-1}), and X
    is the hidden true/inherent rating of a movie (also takes on a value in
    {0, 1, ..., M-1}).

    Please refer to the instructions of the project to see what the
    likelihood for ratings should be.

    Output
    ------
    - likelihood: an M row by M column matrix stored as a 2D NumPy array;
        likelihood[k, m] gives the probability that Y = k given X = m
    """

    # define the size to begin with
    likelihood = np.zeros((M, M))

    # -------------------------------------------------------------------------
    # YOUR CODE GOES HERE FOR PART (c)
    #
    # Remember to normalize the likelihood, so that each column is a
    # probability distribution.
    #
    for Y in range(M):
        for X in range(M):
            likelihood[Y,X] = 1 / abs(Y-X) if Y != X else 2
    for X in range(M):
        likelihood[:,X] /= np.sum(likelihood[:,X])
    #
    # END OF YOUR CODE FOR PART (c)
    # -------------------------------------------------------------------------

    return likelihood


def infer_true_movie_ratings(num_observations=-1):
    """
    For every movie, computes the posterior distribution and MAP estimate of
    the movie's true/inherent rating given the movie's observed ratings.

    Input
    -----
    - num_observations: integer that specifies how many available ratings to
        use per movie (the default value of -1 indicates that all available
        ratings will be used).

    Output
    ------
    - posteriors: a 2D array consisting of the posterior distributions where
        the number of rows is the number of movies, and the number of columns
        is M, i.e., the number of possible ratings (remember ratings are
        0, 1, ..., M-1); posteriors[i] gives a length M vector that is the
        posterior distribution of the true/inherent rating of the i-th movie
        given ratings for the i-th movie (where for each movie, the number of
        observations used is precisely what is specified by the input variable
        `num_observations`)
    - MAP_ratings: a 1D array with length given by the number of movies;
        MAP_ratings[i] gives the true/inherent rating with the highest
        posterior probability in the distribution `posteriors[i]`
    """

    M = 11  # all of our ratings are between 0 and 10
    prior = np.array([1.0 / M] * M)  # uniform distribution
    likelihood = compute_movie_rating_likelihood(M)

    # get the list of all movie IDs to process
    movie_id_list = movie_data_helper.get_movie_id_list()
    num_movies = len(movie_id_list)

    # -------------------------------------------------------------------------
    # YOUR CODE GOES HERE FOR PART (d)
    #
    # Your code should iterate through the movies. For each movie, your code
    # should:
    #   1. Get all the observed ratings for the movie. You can artificially
    #      limit the number of available ratings used by truncating the ratings
    #      vector according to num_observations.
    #   2. Use the ratings you retrieved and the function compute_posterior to
    #      obtain the posterior of the true/inherent rating of the movie
    #      given the observed ratings
    #   3. Find the rating for each movie that maximizes the posterior

    # These are the output variables - it's your job to fill them.
    posteriors = np.zeros((num_movies, M))
    MAP_ratings = np.zeros(num_movies)

    for i in range(len(movie_id_list)):
        movie_id = movie_id_list[i]
        all_ratings = movie_data_helper.get_ratings(movie_id)
        if num_observations > 0:
            all_ratings = all_ratings[:num_observations]
        posteriors[i,:] = compute_posterior(prior, likelihood, all_ratings)
        #print np.argmax(posteriors[i,:]), np.max(posteriors[i,:]), posteriors[i,:]
        MAP_ratings[i] = all_ratings[np.argmax(posteriors[i,:])]

    #
    # END OF YOUR CODE FOR PART (d)
    # -------------------------------------------------------------------------
    
    return posteriors, MAP_ratings


def compute_entropy(distribution):
    """
    Given a distribution, computes the Shannon entropy of the distribution in
    bits.

    Input
    -----
    - distribution: a 1D array of probabilities that sum to 1

    Output:
    - entropy: the Shannon entropy of the input distribution in bits
    """

    # -------------------------------------------------------------------------
    # ERROR CHECK -- DO NOT MODIFY
    #
    if np.abs(1 - np.sum(distribution)) > 1e-6:
        exit('In compute_entropy: distribution should sum to 1.')
    #
    # END OF ERROR CHECK
    # -------------------------------------------------------------------------

    # -------------------------------------------------------------------------
    # YOUR CODE GOES HERE FOR PART (f)
    #
    # Be sure to:
    # - use log base 2
    # - enforce 0log0 = 0
    distribution = distribution[distribution > 0]
    entropy = -np.sum(distribution*np.log2(distribution))
    
    #
    # END OF YOUR CODE FOR PART (f)
    # -------------------------------------------------------------------------

    return entropy


def compute_true_movie_rating_posterior_entropies(num_observations):
    """
    For every movie, computes the Shannon entropy (in bits) of the posterior
    distribution of the true/inherent rating of the movie given observed
    ratings.

    Input
    -----
    - num_observations: integer that specifies how many available ratings to
        use per movie (the default value of -1 indicates that all available
        ratings will be used)

    Output
    ------
    - posterior_entropies: a 1D array; posterior_entropies[i] gives the Shannon
        entropy (in bits) of the posterior distribution of the true/inherent
        rating of the i-th movie given observed ratings (with number of
        observed ratings given by the input `num_observations`)
    """

    # -------------------------------------------------------------------------
    # YOUR CODE GOES HERE FOR PART (g)
    #
    # Make use of the compute_entropy function you coded in part (f).

    #
    # END OF YOUR CODE FOR PART (g)
    # -------------------------------------------------------------------------
    posteriors, MAP_ratings = infer_true_movie_ratings(num_observations)
    #print MAP_ratings
    posterior_entropies = np.zeros(posteriors.shape[0])
    for i in range(len(posterior_entropies)):
        posterior_entropies[i] = compute_entropy(posteriors[i,:])
    
    return posterior_entropies


def main():

    # -------------------------------------------------------------------------
    # ERROR CHECKS
    #
    # Here are some error checks that you can use to test your code.

    print("Posterior calculation (few observations)")
    prior = np.array([0.6, 0.4])
    likelihood = np.array([
        [0.7, 0.98],
        [0.3, 0.02],
    ])
    y = [0]*2 + [1]*1
    print("My answer:")
    print(compute_posterior(prior, likelihood, y))
    print("Expected answer:")
    print(np.array([[0.91986917, 0.08013083]]))

    #print(compute_movie_rating_likelihood(3))
    
    print("---")
    print("Entropy of fair coin flip")
    distribution = np.array([0.5, 0.5])
    print("My answer:")
    print(compute_entropy(distribution))
    print("Expected answer:")
    print(1.0)

    print("Entropy of coin flip where P(heads) = 0.25 and P(tails) = 0.75")
    distribution = np.array([0.25, 0.75])
    print("My answer:")
    print(compute_entropy(distribution))
    print("Expected answer:")
    print(0.811278124459)

    print("Entropy of coin flip where P(heads) = 0.75 and P(tails) = 0.25")
    distribution = np.array([0.75, 0.25])
    print("My answer:")
    print(compute_entropy(distribution))
    print("Expected answer:")
    print(0.811278124459)
    
    
    #
    # END OF ERROR CHECKS
    # -------------------------------------------------------------------------

    # -------------------------------------------------------------------------
    # YOUR CODE GOES HERE FOR TESTING THE FUNCTIONS YOU HAVE WRITTEN,
    # for example, to answer the questions in part (e) and part (h)
    #
    # Place your code that calls the relevant functions here.  Make sure it's
    # easy for us graders to run your code. You may want to define multiple
    # functions for each of the parts of this problem, and call them here.

    posteriors, MAP_ratings = infer_true_movie_ratings()
    #print posteriors
    #print MAP_ratings
    #print np.max(MAP_ratings)
    #print movie_data_helper.get_movie_id_list()[np.argmax(MAP_ratings)]
    for movie_id in np.argwhere(MAP_ratings == np.max(MAP_ratings)).flatten().tolist():
        print movie_data_helper.get_movie_name(movie_id)
    entropies = compute_true_movie_rating_posterior_entropies(-1)
    print np.mean(entropies)
    plt.style.use('ggplot')
    axes = plt.gca()
    axes.set_xlim([0,500])
    plt.scatter(range(len(MAP_ratings)), MAP_ratings, s=50)
    plt.xlabel('movie index', fontsize=18)
    plt.ylabel('MAP ratings', fontsize=18)
    plt.show()
    axes = plt.gca()
    axes.set_xlim([0,500])
    axes.set_ylim([0,1.5])
    plt.scatter(range(len(entropies)), entropies, s=50)
    plt.xlabel('movie index', fontsize=18)
    plt.ylabel('posterior entropy of movie ratings', fontsize=18)
    plt.show()
    axes = plt.gca()
    axes.set_xlim([0,1.5])
    plt.hist(entropies)#, bins=[i*0.01 for i in range(150)])
    plt.xlabel('posterior entropy of movie ratings', fontsize=18)
    plt.ylabel('# movies', fontsize=18)
    plt.show()
    avg_entropies = np.zeros(len(entropies))
    for i in range(len(entropies)):
        avg_entropies[i] = np.mean(entropies[:i])
    axes = plt.gca()
    axes.set_xlim([0,500])
    plt.scatter(range(len(avg_entropies)), avg_entropies, s=50)
    plt.xlabel('# movies', fontsize=18)
    plt.ylabel('mean posterior entropy of movie ratings', fontsize=18)
    plt.show()
    import seaborn as sns
    axes.set_xlim([0,1.5])
    axes.set_ylim([0,0.06])
    sns.set_style('whitegrid')
    sns.kdeplot(np.array(entropies), bw=0.05)
    plt.xlabel('posterior entropy of movie ratings', fontsize=18)
    plt.ylabel('density', fontsize=18)
    plt.show()
    

    #
    # END OF YOUR CODE FOR TESTING
    # -------------------------------------------------------------------------


if __name__ == '__main__':
    main()
