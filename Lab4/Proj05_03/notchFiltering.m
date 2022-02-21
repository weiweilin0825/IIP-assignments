function [output_f,Notch] = notchFiltering(input_f, D0, u0, v0)

[M, N, C] = size(input_f);
Notch = zeros(M, N, C, 'single');
output_f = zeros(M, N, C, 'single');

for u = 1 : M
    for v = 1 : N
        d1 = (((u - 1) - M / 2 - u0) ^ 2 + ((v - 1) - N / 2 - v0) ^ 2) ^ (1 / 2);
        d2 = (((u - 1) - M / 2 + u0) ^ 2 + ((v - 1) - N / 2 + v0) ^ 2) ^ (1 / 2);
        if d1 <= D0 || d2 <= D0
            Notch(u, v, 1) = 0;
        else
            Notch(u, v, 1) = 1;
        end
        output_f(u, v, 1) = Notch(u, v, 1) * input_f(u, v, 1);
    end
end
end

