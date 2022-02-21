clear;
clc;
close all;

%Proj03-01: Image Enhancement Using Intensity Transformations
%logTransform
input_image = imread('Fig0308(a)(fractured_spine).tif');
fprintf('Proj03-01:Image Enhancement Using Intensity Transformations\n');
fprintf('First part:Image enhancement with logTransform\n');
c = input('Enter the c value you want: \n');

output_image_1 = logTransform(input_image, c);

imwrite(output_image_1,'Proj03-01-logTransform.png');

%powerlawTransform
fprintf('Second part:Image enhancement with powerlawTranform\n');
c = input('Enter the c value you want: \n');
r = input('Enter the gamma value you want: \n');

output_image_2 = powerlawTransform(input_image, c, r);

imwrite(output_image_2,'Proj03-01-powerlawTransform.png');

subplot(1, 3, 1); imshow(input_image); title('Original Image');
subplot(1, 3, 2); imshow(output_image_1); title('Image after logTransform');
subplot(1, 3, 3); imshow(output_image_2); title('Image after powerlawTransform');
