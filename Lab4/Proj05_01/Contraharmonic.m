function [output_s] = Contraharmonic(input_s, r, c, Q)

[M, N] = size(input_s);
output_s = zeros(M, N, 'uint8');
r = floor(r / 2);
c = floor(c / 2);

for x = 1 : M
    for y = 1 : N    
        numerators = [];
        denominators = [];
        for i = -r : r
            for j = -c : c
                newx = x + i;
                newy = y + j;
                if newx ~= 0 && newx ~= M + 1
                    if newy ~= 0 && newy ~= N + 1
                        value = double(input_s(newx, newy));
                        value_n = value ^ (Q + 1);
                        value_d = value ^ Q;
                        numerators = [numerators, value_n];
                        denominators = [denominators, value_d];
                    end
                end
            end
        end
        sum_n = sum(numerators);
        sum_d = sum(denominators);
        output_s(x, y) = sum_n/ sum_d;
    end
end

end

