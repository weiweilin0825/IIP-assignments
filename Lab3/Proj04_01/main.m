clear;
clc;
close all;

%Proj04-01:Two-Dimensional Fast Fourier Transform

fprintf('Proj04-01:Two-Dimensional Fast Fourier Transform\n');
input_image = im2single(imread('Fig0431(d)(blown_ic_crop).tif'));
pad_input = padarray(input_image, size(input_image), 0, 'post');
pad_input = imresize(pad_input,0.125);
[M, N, C] = size(pad_input);
shift_input = zeros(M, N, C, 'single');

for x = 1 : M
    for y = 1 : N
        shift_input(x, y) = pad_input(x, y)*((-1)^(x + y - 2));
    end
end

f_output = myDFT2(shift_input);
%f_output = fft2(shift_input);
filter = myGLPF(10, M, N);
filtered_fourier = zeros(M, N, C, 'single');

for x = 1 : M
    for y = 1 : N
        filtered_fourier(x, y, 1) = filter(x, y, 1) * f_output(x, y, 1);
    end
end

filtered_image = abs(myIDFT2(filtered_fourier));
%filtered_image = abs(ifft2(filtered_fourier));

for x = 1 : M
    for y = 1 : N
        filtered_image(x, y, 1) = filtered_image(x, y, 1) *((-1)^(x + y - 2));
    end
end

resized_filtered_image = filtered_image(1 : M/2, 1 : N/2);

subplot(4, 2, 1); imshow(input_image); title('Original image');
subplot(4, 2, 2); imshow(pad_input); title('Padded image');
subplot(4, 2, 3); imshow(shift_input); title('Shifted image');
subplot(4, 2, 4); imshow(log(1+abs(f_output)),[]); title('Fourier transform of shifted image');
subplot(4, 2, 5); imshow(filter); title('Image of gaussian low pass filter');
subplot(4, 2, 6); imshow(log(1+abs(filtered_fourier))); title('Filtered spectrum');
subplot(4, 2, 7); imshow(filtered_image); title('Image after filtered');
subplot(4, 2, 8); imshow(resized_filtered_image); title('Final result');