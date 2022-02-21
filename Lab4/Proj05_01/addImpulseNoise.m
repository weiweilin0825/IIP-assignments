function [output_s] = addImpulseNoise(input_s, Ps, Pp)

[M, N, C] = size(input_s);
output_s = zeros(M, N, C, 'uint8');

for x = 1 : M
    for y = 1 : N
        changed = 0;
        p = rand();
        if p < Ps
            output_s(x, y, 1) = 255;
            changed = 1;
        end
        if changed == 0
            p = rand();
            if p < Pp
                output_s(x, y, 1) = 0;
            else
                output_s(x, y, 1) = input_s(x, y, 1);
            end
        end
    end
end

end

