# Disaster-Image-Processing

#Features
Grayscale Conversion
Converts RGB images to grayscale for better processing.

Noise Reduction
Applies Gaussian filtering to reduce image noise and preserve key features.

Edge Detection
Detects edges in images using the Canny edge detection algorithm.

Contrast Adjustment
Enhances the image contrast for better visibility of key elements.

Disaster Classification
Classifies images as Fire, Flood, or Unknown based on average red and blue intensity thresholds.

Final Output with Edge Overlay
Overlays detected edges on the contrast-enhanced image and saves results.

Prerequisites
MATLAB environment installed.
Input images in .jpg format.
Knowledge of basic MATLAB functions.
Setup Instructions
Input Directory
Update the input_folder variable with the path to your folder containing disaster images.

Output Directory
Update the output_folder variable with the desired path to save processed images.
If the folder doesn’t exist, the script will create it automatically.

Step-by-Step Process
Image Loading and Grayscale Conversion

Reads images from the input directory.
Converts images to grayscale using rgb2gray().
Noise Reduction

Applies Gaussian filtering using imgaussfilt() to reduce noise while preserving edges.
Edge Detection

Detects edges with the Canny method via edge().
Contrast Adjustment

Enhances image contrast using imadjust() for better distinction between dark and light regions.
Disaster Classification

Calculates average red and blue channel intensities.
Classifies the disaster type based on the thresholds:
Fire: High red intensity.
Flood: High blue intensity.
Unknown: Neither condition met.
Final Image with Edge Overlay

Superimposes edges on the contrast-enhanced image using visboundaries().
Saves the final output with disaster classification in the title.
Execution and Output
The script processes all .jpg images in the input folder.
Stepwise processed images (grayscale, denoised, edges, contrast-adjusted, and final overlay) are saved in the output folder.
Disaster classification results are printed in the MATLAB console.
A completion message is displayed once all images are processed.
