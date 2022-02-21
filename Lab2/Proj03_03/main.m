clear;1
clc;
close all;

%Proj03-03: Spatial Filtering

input_image = imread('Fig0338(a)(blurry_moon).tif');

fprintf('Proj03-03: Spatial Filtering\n');

mask_size = input('Enter the mask size you want: \n');

for a = 1:mask_size
  for b = 1:mask_size
    mask(a,b) = input(sprintf('please enter value at mask position(%d, %d) >> ', a, b));
  end
end

output_image = spatialFiltering(input_image, mask);

imwrite(output_image,'Proj03-03.png');
subplot(1, 2, 1); imshow(input_image); title('Original Image');
subplot(1, 2, 2); imshow(output_image); title('Image after spatial filtering');

