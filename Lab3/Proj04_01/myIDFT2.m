function [output] = myIDFT2(input)

[M, N, C] = size(input);
output = zeros(M, N, C, 'single');

for x = 1 : M
    for y = 1 : N
        for u = 1 : M
            for v = 1 : N
                output(x, y) = output(x, y) + input(u, v) * exp(1j * 2 * pi * ((u-1)*(x-1)/M  + (v-1)*(y-1)/N));
            end
        end
        output(x, y) = output(x, y) / (M * N);
    end
end


end

