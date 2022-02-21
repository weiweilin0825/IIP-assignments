clear;
clc;
close all;

%Proj03-04: Enhancement Using the Laplacian 

fprintf('Proj03-04: Enhancement Using the Laplacian\n');
input_image = imread('Fig0338(a)(blurry_moon).tif');

scale = input('Enter the scale you want: \n');

laplacianMask_1 = [0 1 0; 1 -4 1; 0 1 0];
laplacianMask_2 = [1 1 1; 1 -8 1; 1 1 1];

[output_image_1, scaledLaplacian_1] = laplacianFiltering(input_image, laplacianMask_1, scale);
[output_image_2, scaledLaplacian_2] = laplacianFiltering(input_image, laplacianMask_2, scale);

subplot(2, 2, 1); imshow(input_image); title('Original Image');
subplot(2, 2, 2); imshow(scaledLaplacian_1); title('Image after spatial filtering');
subplot(2, 2, 3); imshow(output_image_1); title('Image sharpened using laplacian_1');
subplot(2, 2, 4); imshow(output_image_2); title('Image sharpened using laplacian_2');

imwrite(output_image_1,'Proj03-04_output1.png');
imwrite(output_image_2,'Proj03-04_output2.png');
imwrite(scaledLaplacian_1,'Proj03-04_laplacian1.png');
imwrite(scaledLaplacian_2,'Proj03-04_laplacian2.png');