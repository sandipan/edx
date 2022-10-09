# robot.py
# Coded by George H. Chen (georgehc@mit.edu) -- updated 10/18/2018
import numpy as np


# -----------------------------------------------------------------------------
# Some constants
#

GRID_WIDTH = 12
GRID_HEIGHT = 8


# -----------------------------------------------------------------------------
# Please read!
#
# Convention: (x, y) = (0, 0) is the top left of the grid
#
# Each hidden state is encoded as (x, y, action)
# where: 0 <= x <= GRID_WIDTH - 1,
#        0 <= y <= GRID_HEIGHT - 1,
#        action is one of
#        {'left', 'right', 'up', 'down', 'stay'}.
# Note that <action> refers to the *previous* action taken so that we arrived
# at (x, y). In particular, it is NOT guaranteed to be the next action to be
# taken by the robot.
#
# Each observed state is encoded as (x, y)
# where: 0 <= x <= GRID_WIDTH - 1,
#        0 <= y <= GRID_HEIGHT - 1.
#


# -----------------------------------------------------------------------------
# A general purpose Distribution class for finite discrete random variables
#

class Distribution(dict):
    """
    The Distribution class extend the Python dictionary such that
    each key's value should correspond to the probability of the key.

    For example, here's how you can create a random variable X that takes on
    value 'spam' with probability .7 and 'eggs' with probability .3:

    X = Distribution()
    X['spam'] = .7
    X['eggs'] = .3

    Methods
    -------
    renormalize():
      scales all the probabilities so that they sum to 1
    get_mode():
      returns an item with the highest probability, breaking ties arbitrarily
    sample():
      draws a sample from the Distribution
    """

    def __missing__(self, key):
        # if the key is missing, return probability 0
        return 0

    def renormalize(self):
        normalization_constant = sum(self.values())
        for key in self.keys():
            self[key] /= normalization_constant

    def get_mode(self):
        maximum = -1
        arg_max = None

        for key in self.keys():
            if self[key] > maximum:
                arg_max = key
                maximum = self[key]

        return arg_max

    def sample(self):
        keys = []
        probs = []
        for key, prob in self.items():
            keys.append(key)
            probs.append(prob)

        rand_idx = np.where(np.random.multinomial(1, probs))[0][0]
        return keys[rand_idx]


# -----------------------------------------------------------------------------
# Functions specifying the robot model (e.g., listing all possible hidden and
# observed states, initial distribution, transition model, observation model)
#

def get_all_hidden_states():
    # lists all possible hidden states
    all_states = []
    for x in range(GRID_WIDTH):
        for y in range(GRID_HEIGHT):
            possible_prev_actions = ['left', 'right', 'up', 'down', 'stay']

            if x == 0:  # previous action could not have been to go right
                possible_prev_actions.remove('right')
            if x == GRID_WIDTH - 1:  # could not have gone left
                possible_prev_actions.remove('left')
            if y == 0:  # could not have gone down
                possible_prev_actions.remove('down')
            if y == GRID_HEIGHT - 1:  # could not have gone up
                possible_prev_actions.remove('up')

            for action in possible_prev_actions:
                all_states.append((x, y, action))
    return all_states


def get_all_observed_states():
    # lists all possible observed states
    all_observed_states = []
    for x in range(GRID_WIDTH):
        for y in range(GRID_HEIGHT):
            all_observed_states.append((x, y))
    return all_observed_states


def initial_distribution():
    # returns a Distribution for the initial hidden state
    prior = Distribution()
    for x in range(GRID_WIDTH):
        for y in range(GRID_HEIGHT):
            prior[(x, y, 'stay')] = 1. / (GRID_WIDTH * GRID_HEIGHT)
    return prior


def transition_model(state):
    # given a hidden state, return the Distribution for the next hidden state
    x, y, action = state
    next_states = Distribution()

    # we can always stay where we are
    if action == 'stay':
        next_states[(x, y, 'stay')] = .2
    else:
        next_states[(x, y, 'stay')] = .1

    if y > 0:  # we can go up
        if action == 'stay':
            next_states[(x, y - 1, 'up')] = .2
        if action == 'up':
            next_states[(x, y - 1, 'up')] = .9
    if y < GRID_HEIGHT - 1:  # we can go down
        if action == 'stay':
            next_states[(x, y + 1, 'down')] = .2
        if action == 'down':
            next_states[(x, y + 1, 'down')] = .9
    if x > 0:  # we can go left
        if action == 'stay':
            next_states[(x - 1, y, 'left')] = .2
        if action == 'left':
            next_states[(x - 1, y, 'left')] = .9
    if x < GRID_WIDTH - 1:  # we can go right
        if action == 'stay':
            next_states[(x + 1, y, 'right')] = .2
        if action == 'right':
            next_states[(x + 1, y, 'right')] = .9

    next_states.renormalize()
    return next_states


def observation_model(state):
    # given a hidden state, return the Distribution for its observation
    x, y, action = state
    observed_states = Distribution()

    radius = 1
    for x_new in range(x - radius, x + radius + 1):
        for y_new in range(y - radius, y + radius + 1):
            if x_new >= 0 and x_new <= GRID_WIDTH - 1 and \
               y_new >= 0 and y_new <= GRID_HEIGHT - 1:
                if (x_new - x)**2 + (y_new - y)**2 <= radius**2:
                    observed_states[(x_new, y_new)] = 1.

    observed_states.renormalize()
    return observed_states


# -----------------------------------------------------------------------------
# Saving and loading lists of hidden states and observations
#

def save_data(filename, hidden_states, observations):
    # saves a list of hidden states and observations to a text file where each
    # line says:
    # <hidden x> <hidden y> <hidden action> <observed x> <observed y>
    # OR
    # <hidden x> <hidden y> <hidden action> missing
    # with the latter happening for a missing observation
    f = open(filename, 'w')
    assert len(hidden_states) == len(observations)

    for time_step in range(len(hidden_states)):
        hidden_x, hidden_y, hidden_action = hidden_states[time_step]
        if observations[time_step] is not None:
            observed_x, observed_y = observations[time_step]
            f.write("%d %d %s %d %d\n"
                    % (hidden_x, hidden_y, hidden_action,
                       observed_x, observed_y))
        else:
            f.write("%d %d %s missing\n"
                    % (hidden_x, hidden_y, hidden_action))

    f.close()


def load_data(filename):
    # loads a list of hidden states and observations saved by save_data()
    f = open(filename, 'r')

    hidden_states = []
    observations = []
    for line in f.readlines():
        line = line.strip()
        if len(line) >= 4:
            parts = line.split()

            hidden_x = int(parts[0])
            hidden_y = int(parts[1])
            hidden_action = parts[2]
            hidden_states.append((hidden_x, hidden_y, hidden_action))

            if parts[3] == 'missing':
                observations.append(None)
            elif len(parts) == 5:
                observed_x = int(parts[3])
                observed_y = int(parts[4])
                observations.append((observed_x, observed_y))

    return hidden_states, observations


def save_hidden_states(filename, hidden_states):
    # saves a list of hidden states to a text file where each line says:
    # <x> <y> <action>
    f = open(filename, 'w')
    for x, y, action in hidden_states:
        f.write("%d %d %s\n" % (x, y, action))
    f.close()


def load_hidden_states(filename):
    # loads a list of hidden states saved by save_hidden_states()
    f = open(filename, 'r')

    hidden_states = []
    for line in f.readlines():
        line = line.strip()
        if len(line) == 3:
            parts = line.split()
            x = int(parts[0])
            y = int(parts[1])
            action = parts[2]
            hidden_states.append((x, y, action))

    f.close()
    return hidden_states


def save_observations(filename, observations):
    # saves a list of observations to a text file where each line says either
    # "<x> <y>" OR "missing"
    f = open(filename, 'w')
    for observation in observations:
        if observation is None:
            f.write("missing\n")
        else:
            x, y = observation
            f.write("%d %d\n" % (x, y))
    f.close()


def load_observations(filename):
    # loads a list of observations saved by save_observations()
    f = open(filename, 'r')

    observations = []
    for line in f.readlines():
        line = line.strip()
        if len(line) == 1 and line == 'missing':
            observations.append(None)
        elif len(line) == 2:
            parts = line.split()
            x = int(parts[0])
            y = int(parts[1])
            observations.append((x, y))

    f.close()
    return observations
