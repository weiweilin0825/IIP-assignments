clear;
clc;
close all;

%Proj05-04:Parametric Wiener Filter

fprintf('Proj05-04:Parametric Wiener Filter\n');
input_image = im2single(imread('Fig0526(a)(original_DIP).tif'));

T = input('Enter the T value you want for motion blur : ');
a = input('Enter the a value you want for motion blur : ');
b = input('Enter the b value you want for motion blur : ');


k1 = input('\nEnter the first k value you want for wiener filter : ');
k2 = input('Enter the second k value you want for wiener filter : ');
k3 = input('Enter the third k value you want for wiener filter : ');

input_spectrum = fftshift(fft2(input_image));
[output_spectrum, H] = addMotionBlur(input_spectrum, T, a, b);
output_image = abs(ifft2(output_spectrum));
noise_output = addGaussianNoise(output_image, 0, 10);
noise_spectrum = fftshift(fft2(noise_output));


filtered_image_1 = abs(ifft2(wienerFiltering(noise_spectrum, H, k1)));
filtered_image_2 = abs(ifft2(wienerFiltering(noise_spectrum, H, k2)));
filtered_image_3 = abs(ifft2(wienerFiltering(noise_spectrum, H, k3)));


psnr_1 = computePSNR(input_image, filtered_image_1);
fprintf('\nk = %f PSNR (dB) = %f \n', k1, psnr_1);
psnr_2 = computePSNR(input_image, filtered_image_2);
fprintf('k = %f PSNR (dB) = %f \n', k2, psnr_2);
psnr_3 = computePSNR(input_image, filtered_image_3);
fprintf('k = %f PSNR (dB)  = %f \n', k3, psnr_3);

subplot(2, 3, 1); imshow(input_image); title('Original image');
subplot(2, 3, 2); imshow(output_image); title('Motion blurred image');
subplot(2, 3, 3); imshow(noise_output); title('Gaussian noise and motion blurred image');
subplot(2, 3, 4); imshow(filtered_image_1); title(sprintf('Filtered image with k = %f', k1));
subplot(2, 3, 5); imshow(filtered_image_2); title(sprintf('Filtered image with k = %f', k2));
subplot(2, 3, 6); imshow(filtered_image_3); title(sprintf('Filtered image with k = %f', k3));

