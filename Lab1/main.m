clear;
clc;
close all;

%Proj02-02: Reducing the Number of Intensity Levels in an Image 

input_image_1 = imread('Fig0221(a)(ctskull-256).tif');
fprintf('Proj02-02: Reducing the Number of Intensity Levels in an Image\n');
intensity=input('Enter the intensity level you want to reduce to(from 2 to 256): \n');

output_image_1 = reduceIntensityLevel(input_image_1, intensity);

imwrite(output_image_1,'Proj02-02.png');
imshow(output_image_1);


%Proj02-03: Zooming and Shrinking Images by Pixel Replication 

input_image_2 = imread('Fig0220(a)(chronometer 3692x2812  2pt25 inch 1250 dpi).tif');
fprintf('Proj02-03: Zooming and Shrinking Images by Pixel Replication \n');
scale_1=input('Enter the scale you want to resize to: \n');

output_image_2 = resizeImage_replication(input_image_2, scale_1);

imwrite(output_image_2,'Proj02-03.png');

recover_image = resizeImage_replication(output_image_2, 1/scale_1);
imwrite(recover_image,'Proj02-03_recover.png');

subplot(1, 2, 1); imshow(output_image_2); title('Image after zooming or shrinking')
subplot(1, 2, 2); imshow(recover_image); title('Resized image after recovering')


%Proj02-04: Zooming and Shrinking Images by Bilinear Interpolation 
input_image_2 = imread('Fig0220(a)(chronometer 3692x2812  2pt25 inch 1250 dpi).tif');
fprintf('Proj02-04: Zooming and Shrinking Images by Bilinear Interpolation  \n');
scale_2=input('Enter the scale you want to resize to: \n');

output_image_3 = resizeImage_bilinear(input_image_2, scale_2);
imwrite(output_image_3, 'Proj02-04.png');

recover_image_bilinear = resizeImage_bilinear(output_image_3, 1/scale_2);
imwrite(recover_image_bilinear,'Proj02-04_recover.png');

subplot(1, 2, 1); imshow(output_image_3); title('Image after zooming or shrinking with BI')
subplot(1, 2, 2); imshow(recover_image_bilinear); title('Resized image after recovering with BI')