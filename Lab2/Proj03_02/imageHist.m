function [histVector] = imageHist(input)

[M, N, C] = size(input);

histVector = zeros(1, 256);

for x = 1:M
    for y = 1:N
        histVector(1, double(input(x, y, 1))+1) = histVector(1, double(input(x, y, 1))+1)+1;
    end
end

end

