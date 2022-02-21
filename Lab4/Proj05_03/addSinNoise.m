function [output_s] = addSinNoise(input_s, A, u0, v0)

[M, N, C] = size(input_s);
noise = zeros(M, N, C, 'single');
output_s = zeros(M, N, C, 'single');

for x = 1 : M
    for y = 1 : N
        noise(x, y, 1) = A * sin(2 * pi * (u0 * (x - 1) / M + v0 * (y - 1) / N));
        output_s(x, y, 1) = input_s(x, y, 1) + noise(x, y, 1);
    end
end

end

