import numpy as np
import cv2
import os
from glob import glob
from tqdm import tqdm
import random


__version__ = '0.1'

class CocoMs:

    def __init__(self, cocoms_folder):       
        print("Initializing CocoMS")
        self.cocoms_folder = cocoms_folder

    def get_data(self, train_data_folder='/Training'):
        images_path = self.cocoms_folder + train_data_folder + '/Images/*.png'
        labels_path = self.cocoms_folder + train_data_folder + '/GT_Images/*.png'

        image_paths = glob(images_path)
        label_paths = {
            os.path.basename(path): path
            for path in glob(labels_path)}

        num_images = len(image_paths)
        num_label_images = len(label_paths)
        if num_images == 0 or num_label_images == 0:
            raise RuntimeError('No data files found in ' + self.cocoms_folder)

        #random.shuffle(image_paths)

        self.image_paths     = image_paths 
        self.num_classes     = 2

        image_files = []
        label_files = []
        
        for image_file in tqdm(self.image_paths, ascii=True, desc='[i] reading images and labels...'):
            label_file = self.cocoms_folder + train_data_folder + '/GT_Images/' + (os.path.basename(image_file))

            image_files.append(image_file)
            label_files.append(label_file)
            
        return np.asarray(image_files), np.asarray(label_files)

    def files_to_data(self, imageFiles, labelFiles):
        label_color = np.array([255, 0, 255])
        images = []
        labels = []

        assert len(imageFiles)==len(labelFiles), "Number of elements in image set and labels must match!"

        for i in range(0,len(imageFiles)):
             image_file = imageFiles[i] 
             label_file = labelFiles[i] 

             image = cv2.imread(image_file)
             label = cv2.imread(label_file)
            
             image = np.rollaxis(image,2).astype(np.float32)

             label_fg  = np.all(label == label_color, axis=2)
             label_bg  = np.any(label != label_color, axis=2)
             label_all = np.dstack([label_bg, label_fg])

             label_all = np.rollaxis(label_all,2).astype(np.float32)

             images.append(image)
             labels.append(label_all)        
            
        # Return the pairs input images / ground truth images
        return np.array(images), np.array(labels)
