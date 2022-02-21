clear;
clc;
close all;

%Proj04-04: Highpass Filtering 

fprintf('Proj04-04: Highpass Filtering\n');
input_image = im2single(imread('Fig0441(a)(characters_test_pattern).tif'));
pad_input = padarray(input_image, size(input_image),'replicate','post');
[M, N, C] = size(pad_input);

for x = 1 : M
    for y = 1 : N
        pad_input(x, y) = pad_input(x, y)*((-1)^(x + y - 2));
    end
end

transformed_image = fft2(pad_input);

filter_60 = myGHPF(60, M, N);
filter_160 = myGHPF(160, M, N);

filtered_fourier_60 = zeros(M, N, 1, 'single');
filtered_fourier_160 = zeros(M, N, 1, 'single');

for u = 1 : M
    for v = 1 : N
        filtered_fourier_60(u, v, 1) = filter_60(u, v, 1) * transformed_image(u, v, 1);
        filtered_fourier_160(u, v, 1) = filter_160(u, v, 1) * transformed_image(u, v, 1);
    end
end
    
filtered_image_60 = abs(ifft2(filtered_fourier_60));
filtered_image_160 = abs(ifft2(filtered_fourier_160));
filtered_image_60 = filtered_image_60(1:M/2,1:N/2);
filtered_image_160 = filtered_image_160(1:M/2,1:N/2);

subplot(2, 1, 1); imshow(filtered_image_60); title('filtered image with D0=60');
subplot(2, 1, 2); imshow(filtered_image_160); title('filtered image with D0=160');