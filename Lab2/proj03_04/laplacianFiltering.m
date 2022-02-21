
function [output, scaledLaplacian] = laplacianFiltering(input, laplacianMask, scale)

[M, N, Ch] = size(input);
output = zeros(M, N, Ch, 'single');

scaledLaplacian = spatialFiltering(input, laplacianMask);

input = single(input);
input = input/255;

for x = 1 : M
    for y = 1 : N
        scaledLaplacian(x, y, 1) = scale * scaledLaplacian(x, y, 1);
        output(x, y, 1) = input(x, y, 1) + scaledLaplacian(x, y, 1);
        if output(x, y, 1)<0
            output(x, y, 1) = 0;
        end
    end
end

end