function [quantizedImage] = reduceIntensityLevel(originalImage,intensityLevel)

[M, N, C] = size(originalImage);
quantizedImage = zeros(M, N, C, 'uint8');

step=fix(255/(intensityLevel-1));

for x = 1 : M
    for y = 1 : N
        quantizedImage(x, y, 1)=round(double(originalImage(x, y, 1)/step))*step;
    end
end

end