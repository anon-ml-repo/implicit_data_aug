#!/bin/bash
set -e  # stop on error

# Install dependencies
pip install -r requirements.txt

# Download dataset
echo "Installing dataset"
curl -L -o numpy_middle.zip "https://zenodo.org/record/16997999/files/numpy_middle.zip?download=1"
unzip -o numpy_middle.zip -d dataset 
curl -L -o numpy_nearwall.zip "https://zenodo.org/record/16997999/files/numpy_nearwall.zip?download=1"
unzip -o numpy_nearwall.zip -d dataset


# Run training
echo "Running training script on middle bos"
python3 src/train.py configs/middle_boxfilter_4x_MultiScale.yaml

echo "Running training script on nearwall box"
python3 src/train.py configs/nearwall_boxfilter_4x_MultiScale.yaml

