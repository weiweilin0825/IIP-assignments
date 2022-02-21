function [output_s] = addGaussianNoise(input_s, mu, sigma)

[M, N, C] = size(input_s);
output_s = zeros(M, N, C, 'single');
noise = zeros(M, N, C, 'single');
maxnum = 0;

for x = 1 : M
    for y = 1 : N
        noise(x, y, 1) = normrnd(mu, sigma);
        output_s(x, y, 1) = input_s(x, y, 1)*255 + noise(x, y, 1);
        if output_s(x, y, 1) > maxnum
            maxnum = output_s(x, y, 1);
        end
    end
end

%fprintf('max = %f \n', maxnum);
output_s(:, :, 1) = output_s(:, :, 1)/maxnum;
    
end

