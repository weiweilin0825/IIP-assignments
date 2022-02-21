clear;
clc;
close all;

%Proj03-02:Histogram Equalization

input_image = imread('Fig0308(a)(fractured_spine).tif');
fprintf('Proj03-02:Histogram Equalization\n');

input_hist = imageHist(input_image);
x = 0:1:255;

[output_image, transformation] = histEqualization(input_image);

output_hist = imageHist(output_image);

imwrite(output_image,'Proj03-02_enhanced_image.png');
saveas(bar(x, input_hist(x+1)),'input_histogram.png');
saveas(bar(x, output_hist(x+1)),'output_histogram.png');
saveas(stairs(x, transformation(x+1)),'transformation_function.png');

subplot(3, 2, 1); imshow(input_image); title('Original Image');
subplot(3, 2, 2); bar(x, input_hist(x+1)); xlim([-inf inf]); xlabel('Intensity'); ylabel('Number of pixels'); title('Histogram of Original Image');
subplot(3, 2, 3); stairs(x, transformation(x+1)); axis([-inf inf -inf inf]); xlabel('Input intensity'); ylabel('Output intensity'); title('Transformation Function');
subplot(3, 2, 4); imshow(output_image); title('Enhanced Image');
subplot(3, 2, 5); bar(x, output_hist(x+1)); xlim([-inf inf]); xlabel('Intensity'); ylabel('Number of pixels'); title('Histogram of Enhanced Image');
