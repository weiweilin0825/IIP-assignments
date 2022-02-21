function [output_s] = GeometricMean(input_s, r, c)

[M, N] = size(input_s);
output_s = zeros(M, N, 'uint8');
mm = r;
nn = c;
r = floor(r / 2);
c = floor(c / 2);

for x = 1 : M
    for y = 1 : N    
        final = 1;
        for i = -r : r
            for j = -c : c
                newx = x + i;
                newy = y + j;
                if newx ~= 0 && newx ~= M + 1
                    if newy ~= 0 && newy ~= N + 1
                        value = double(input_s(newx, newy));
                        final = final * value;
                    end
                end
            end
        end
        output_s(x, y) = final ^ (1 / (mm * nn));
    end
end

end

