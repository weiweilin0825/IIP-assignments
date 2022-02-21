clear;
clc;
close all;

%Proj04-03: Lowpass Filtering 

fprintf('Proj04-03: Lowpass Filtering\n');
input_image = im2single(imread('Fig0441(a)(characters_test_pattern).tif'));
pad_input = padarray(input_image, size(input_image),'replicate','post');
[M, N, C] = size(pad_input);

for x = 1 : M
    for y = 1 : N
        pad_input(x, y) = pad_input(x, y)*((-1)^(x + y - 2));
    end
end

transformed_image = fft2(pad_input);

filter_10 = myGLPF(10, M, N);
filter_30 = myGLPF(30, M, N);
filter_60 = myGLPF(60, M, N);
filter_160 = myGLPF(160, M, N);
filter_460 = myGLPF(460, M, N);

filtered_fourier = zeros(M, N, 1, 'single');

for u = 1 : M
    for v = 1 : N
        filtered_fourier_10(u, v, 1) = filter_10(u, v, 1) * transformed_image(u, v, 1);
        filtered_fourier_30(u, v, 1) = filter_30(u, v, 1) * transformed_image(u, v, 1);
        filtered_fourier_60(u, v, 1) = filter_60(u, v, 1) * transformed_image(u, v, 1);
        filtered_fourier_160(u, v, 1) = filter_160(u, v, 1) * transformed_image(u, v, 1);
        filtered_fourier_460(u, v, 1) = filter_460(u, v, 1) * transformed_image(u, v, 1);
    end
end
    
filtered_image_10 = abs(ifft2(filtered_fourier_10));
filtered_image_30 = abs(ifft2(filtered_fourier_30));
filtered_image_60 = abs(ifft2(filtered_fourier_60));
filtered_image_160 = abs(ifft2(filtered_fourier_160));
filtered_image_460 = abs(ifft2(filtered_fourier_460));

filtered_image_10 = filtered_image_10(1:M/2,1:N/2);
filtered_image_30 = filtered_image_30(1:M/2,1:N/2);
filtered_image_60 = filtered_image_60(1:M/2,1:N/2);
filtered_image_160 = filtered_image_160(1:M/2,1:N/2);
filtered_image_460 = filtered_image_460(1:M/2,1:N/2);

subplot(2, 3, 1); imshow(input_image); title('Original image');
subplot(2, 3, 2); imshow(filtered_image_10,[]); title('D0=10');
subplot(2, 3, 3); imshow(filtered_image_30,[]); title('D0=30');
subplot(2, 3, 4); imshow(filtered_image_60,[]); title('D0=60');
subplot(2, 3, 5); imshow(filtered_image_160,[]); title('D0=160');
subplot(2, 3, 6); imshow(filtered_image_460,[]); title('D0=460');

