function [output] = powerlawTransform(input, c, r)

input = single(input);
[M, N, Ch] = size(input);
output = zeros(M, N, Ch, 'single');

max=0;

for x = 1:M
    for y = 1:N
        output(x, y, 1) = c*(double(input(x, y, 1))^r);
        if output(x, y, 1) > max
            max = output(x, y, 1);
        end
    end
end

scale = 1/max;
output(:, :, :) = scale*output(:, :, :);

end


