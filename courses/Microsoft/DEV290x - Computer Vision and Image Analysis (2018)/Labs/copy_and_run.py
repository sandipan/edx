from __future__ import print_function
import shutil
import os
import sys
import cifar_utils as ut
import time

# Simple script to setup CIFAR-10 in the data partition
# It performs a check to see if its files are there to avoid unnecessary work, but you can force it
# using '-f' as a command line argument

cwd = os.getcwd()
destination = '/home/nbuser/data/M3/CIFAR-10'
source = os.path.dirname(os.path.realpath(__file__))

force = False
try:
    if (sys.argv[1] == '-f'):
        force = True
        print("Force selected")
except IndexError:
    force = False

try:
    if ((force) or (not os.path.exists('{}/test_map.txt'.format(destination)))):
        cifar10_start = time.time()
        print('Cleaning up...')
        shutil.rmtree(destination, ignore_errors=True)
        print('Copying utilities...')
        shutil.copytree('{}'.format(source), destination)
        print('Changing directory to {}...'.format(destination))
        os.chdir(destination)
        print('Running install_cifar10')
         
        trn, tst= ut.loadData('http://www.cs.toronto.edu/~kriz/cifar-10-python.tar.gz')
        print ('Writing train text file...', flush=True)
        ut.saveTxt(r'./Train_cntk_text.txt', trn)
        print ('Done.', flush=True)
        print ('Writing test text file...', flush=True)
        ut.saveTxt(r'./Test_cntk_text.txt', tst)
        print ('Done.', flush=True)
         
        print ('Converting train data to png images...', flush=True)
        ut.saveTrainImages(r'./Train_cntk_text.txt', 'train')
        print ('Done.', flush=True)
        print ('Converting test data to png images...', flush=True)
        ut.saveTestImages(r'./Test_cntk_text.txt', 'test')
        print ('Done.', flush=True)
        print('CIFAR-10 setup time: {} s.'.format(time.time()-cifar10_start))
    else:
        print('{} already exists - nothing to do...'.format(destination))
finally:
    os.chdir(cwd)
