function [output] = spatialFiltering(input, mask)

input = single(input);
[M, N, C] = size(input);
pad_input = padarray(input,size(mask),'replicate','both');
[PM, PN, PC] = size(pad_input);
output = zeros(PM, PN, PC, 'single');

mask_size = size(mask, 1);

for x = 1 : PM - mask_size + 1
    for y = 1: PN - mask_size + 1
       sum = 0;
       for i = 1 : mask_size
           for j = 1 : mask_size
              sum = sum + mask(i,j) * pad_input(x+i-1,y+j-1); 
           end
       end
       output(x + (mask_size + 1) / 2, y + (mask_size + 1) / 2) = sum;
    end
end

output = output(mask_size+1 : PM - mask_size, mask_size + 1 : PN - mask_size);
output = output/255;

end

