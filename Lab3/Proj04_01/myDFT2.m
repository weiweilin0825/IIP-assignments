function [output] = myDFT2(input)

[M, N, C] = size(input);
output = zeros(M, N, C, 'single');

for u = 1 : M
    for v = 1 : N
        for x = 1 : M
            for y = 1 : N
                output(u, v) = output(u, v) + input(x, y) * exp(-1j * 2 * pi * ((u-1)*(x-1)/M  + (v-1)*(y-1)/N));
            end
        end
    end
end

end

