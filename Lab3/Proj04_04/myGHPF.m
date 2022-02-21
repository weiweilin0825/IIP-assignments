function [output] = myGHPF(D0, M, N)

output = zeros(M, N, 1, 'single');

for u = 1 : M
    for v = 1 : N
        D = sqrt((u - M/2)^2+(v - N/2)^2);
        output(u, v, 1) = 1-exp(-D^2 / (2*(D0^2)));
    end
end

end