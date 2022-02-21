function [output, T] = histEqualization(input)

[M, N, C] = size(input);
p = double(zeros(1, 256));
T = zeros(1, 256);
input_hist = imageHist(input);
l = 255;
pixelNum = M*N;
output = zeros(M, N, C, 'uint8');

for i = 1:256
    p(i) = double(input_hist(i)/pixelNum);
    if i == 1
        T(i) = l*p(i);
    else
        T(i) = l*p(i)+T(i-1);
    end
end

T(:) = round(T(:));

for x = 1:M
    for y = 1:N
        output(x, y, 1) = T(double(input(x, y, 1))+1);
    end
end

end

