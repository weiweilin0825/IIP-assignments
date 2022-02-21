function [output_f, H] = addMotionBlur(input_f, T, a, b)

[M, N, C] = size(input_f);
output_f = zeros(M, N, C, 'single');
H = zeros(M, N, C, 'single');

H = fftshift(H);

for u = 1 : M
    for v = 1 : N
        H(u, v, 1) = (T / (pi * (a * (u - (M / 2) -1) + b * (v - (N / 2) - 1)))) * sin(pi * (a * (u - (M / 2) - 1) + b * (v - (N / 2) - 1))) * exp(-1j * pi * (a * (u - (M / 2) - 1) + b * (v - (N / 2) - 1))); 
    end
end

H(isnan(H)) = 1;
output_f = input_f .* H;

end

