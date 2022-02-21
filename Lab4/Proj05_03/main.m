clear;
clc;
close all;

%Proj05-01:Periodic Noise Reduction Using a Notch Filter

fprintf('Proj05-01:Periodic Noise Reduction Using a Notch Filter\n');
input_image = im2single(imread('Fig0526(a)(original_DIP).tif'));
[M, N, C] = size(input_image);

amplitude = input('Enter the amplitude you want for sin noise : ');
u0 = input('Enter the u0 you want for sin noise : ');
v0 = input('Enter the v0 you want for sin noise : ');
D0 = input('Enter the D0 you want for notch filter : ');

spatial_sin = addSinNoise(input_image, amplitude, u0, v0);
spectrum_sin = fftshift(fft2(spatial_sin));

[filtered_spectrum, notch] = notchFiltering(spectrum_sin, D0, u0, v0);
filtered_image = abs(ifft2(filtered_spectrum));

psnr = computePSNR(input_image, filtered_image);
fprintf('\nPSNR (dB) = %f \n', psnr);

subplot(3, 2, 1); imshow(input_image); title('Original image');
subplot(3, 2, 2); imshow(spatial_sin); title('Sin noise image');
subplot(3, 2, 3); imshow(log(1 + abs(spectrum_sin)),[]); title('Sin noise spectrum image');
subplot(3, 2, 4); imshow(log(1 + abs(notch)),[]); title('Notch filter');
subplot(3, 2, 5); imshow(log(1 + abs(filtered_spectrum)),[]); title('Spectrum after filtered');
subplot(3, 2, 6); imshow(filtered_image); title('Image after filtered');