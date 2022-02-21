function [output_f] = wienerFiltering(input_f, H, K)

[M, N, C] = size(input_f);
output_f = zeros(M, N, C, 'single');
w = zeros(M, N, C, 'single');

for u = 1 : M
    for v = 1 : N
        w(u, v) = (1 / H(u, v)) * (abs(H(u, v)) ^ 2 / (abs(H(u, v)) ^ 2 + K));
        output_f(u, v) = input_f(u, v) * w(u, v);
    end
end

end

