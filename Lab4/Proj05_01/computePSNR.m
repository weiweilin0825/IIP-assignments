function [psnr] = computePSNR(input1_s,input2_s)
input1_s = 255 * im2single(input1_s);
input2_s = 255 * im2single(input2_s);
[M, N, C] = size(input1_s);
value = 0;

for x = 1 : M
    for y = 1 : N
        value = value + ((input1_s(x, y, 1) - input2_s(x, y, 1)) ^ 2);
    end
end

psnr = 10 * log10(M * N * (255 ^ 2) / value);

end

