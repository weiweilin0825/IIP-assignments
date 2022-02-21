function [resizedImage] = resizeImage_bilinear(originalImage,scalingFactor)

[M, N, C] = size(originalImage);
resized_M = round(M * scalingFactor);
resized_N = round(N * scalingFactor);

[tn, tm] = meshgrid(1:resized_N, 1:resized_M);

tm = tm/scalingFactor;
tn = tn/scalingFactor;

fm = floor(tm);
fn = floor(tn);
fm(fm < 1) = 1;
fn(fn < 1) = 1;
fm(fm > M - 1) = M - 1;
fn(fn > N - 1) = N - 1;

a = tm - fm;
b = tn - fn;

x_y = sub2ind([M, N], fm, fn);
x_next_y = sub2ind([M, N], fm+1, fn);
x_y_next = sub2ind([M, N], fm, fn+1);
x_next_y_next = sub2ind([M, N], fm+1, fn+1);

resizedImage = zeros(resized_M, resized_N, C, 'uint8');

value = double(originalImage(:, :, 1));

temp = value(x_y).*(1-a).*(1-b) + value(x_next_y).*a.*(1-b) + value(x_y_next).*(1-a).*b + value(x_next_y_next).*a.*b;

resizedImage(:,:,1) = cast(temp, class(originalImage));

end

