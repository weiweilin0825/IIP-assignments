clear;
clc;
close all;

%Proj04-02: Fourier Spectrum and Average Value

fprintf('Proj04-02: Fourier Spectrum and Average Value\n');
input_image = im2single(imread('Fig0441(a)(characters_test_pattern).tif'));
pad_input = padarray(input_image, size(input_image),0,'post');
[M, N, C] = size(pad_input);

mean_input = 0;
for x = 1 : M / 2
    for y = 1 : N / 2
        mean_input = mean_input + input_image(x, y);
    end
end
mean_input = mean_input / ((M / 2) * (N / 2));

for x = 1 : M
    for y = 1 : N
        pad_input(x, y) = pad_input(x, y)*((-1)^(x + y - 2));
    end
end

transformed_image = fft2(pad_input);

transformed_image = fft2(pad_input);
mean_fourier = transformed_image(689, 689)/ ((M / 2) * (N / 2));

fprintf('The mean of the input image = %f\n', mean_input);
fprintf('The mean of the fourier spectrum  = %f\n', mean_fourier);

subplot(1, 2, 1); imshow(input_image); title('Original image');
subplot(1, 2, 2); imshow(log(1+abs(transformed_image)),[]); title('Spectrum of the image');