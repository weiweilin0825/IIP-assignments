clear;
clc;
close all;

%Proj05-01:Noise Generators

fprintf('Proj05-01:Noise Generators\n');
input_image = imread('Fig0507(a)(ckt-board-orig).tif');

mu = input('Enter the mu value you want to add gaussain noise :');
sigma = input('Enter the sigma value you want to add gaussain noise :');
Ps = input('\nEnter the Ps value you want to add salt noise :');
Pp = input('Enter the Pp value you want to add pepper noise :');
m = input('\nEnter the m value you want to create median filter :');
n = input('Enter the n value you want to create median filter :');
qp = input('Enter the Q value you want to create contraharmonic filter for pepper noise :');
qs = input('Enter the Q value you want to create contraharmonic filter for salt noise :');

gaussian_output = addGaussianNoise(input_image, mu, sigma);
pepper_output = addImpulseNoise(input_image, 0, Pp);
salt_output = addImpulseNoise(input_image, Ps, 0);
salt_pepper_output = addImpulseNoise(input_image, Ps, Pp);

median_filtered = MedianFilter(salt_pepper_output, m, n);
arith_filtered = Contraharmonic(gaussian_output, m, n, 0);
geometric_filtered = GeometricMean(gaussian_output, m, n);
pepper_filtered = Contraharmonic(pepper_output, m, n, qp);
salt_filtered = Contraharmonic(salt_output, m, n, qs);

psnr_arithmetic = computePSNR(input_image, arith_filtered);
psnr_geometric = computePSNR(input_image, geometric_filtered);
psnr_median = computePSNR(input_image, median_filtered);
psnr_pepper = computePSNR(input_image, pepper_filtered);
psnr_salt = computePSNR(input_image, salt_filtered);

fprintf('\nPSNR (dB) of arithmetic mean filtered gaussian noise image = %f\n', psnr_arithmetic);
fprintf('PSNR (dB) of geometric mean filtered gaussian noise image = %f\n', psnr_geometric);
fprintf('PSNR (dB) of median filtered salt and pepper image = %f\n', psnr_median);
fprintf('PSNR (dB) of contraharmonic filtered pepper image = %f\n', psnr_pepper);
fprintf('PSNR (dB) of contraharmonic filtered salt image = %f\n', psnr_salt);

subplot(4, 3, 1); imshow(input_image); title('Original image');
subplot(4, 3, 2); imshow(gaussian_output); title('Gaussian noise image');
subplot(4, 3, 3); imshow(pepper_output); title('Pepper noise image');
subplot(4, 3, 4); imshow(salt_output); title('Salt noise image');
subplot(4, 3, 5); imshow(salt_pepper_output); title('Salt and pepper noise image');
subplot(4, 3, 6); imshow(arith_filtered); title('Arithmetic mean filtered gaussian noise image');
subplot(4, 3, 7); imshow(geometric_filtered); title('Geometric mean filtered gaussian noise image');
subplot(4, 3, 8); imshow(median_filtered); title('Median filtered salt and pepper image');
subplot(4, 3, 9); imshow(pepper_filtered); title('Contraharmonic filtered pepper image');
subplot(4, 3, 10); imshow(salt_filtered); title('Contraharmonic filtered salt image');