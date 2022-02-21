function [resizedImage] = resizeImage_replication(originalImage,scalingFactor)

[M, N, C] = size(originalImage);
resized_M = round(M * scalingFactor);
resized_N = round(N * scalingFactor);
resizedImage = zeros(resized_M, resized_N, C, 'uint8');

for x = 1 : resized_M
    for y = 1 : resized_N
        new_x=round(x/scalingFactor);
        new_y=round(y/scalingFactor);
        if new_x==0
            new_x=1;
        elseif new_x>M
            new_x=M;
        end    
        
        if new_y==0
            new_y=1;
        elseif new_y>N
            new_y=N;
        end
        
        resizedImage(x, y, 1)=originalImage(new_x, new_y, 1);
    end
end

end
%{
        if x < scalingFactor && y < scalingFactor
            resizedImage(x, y, 1)=originalImage(1, 1, 1);
        elseif x < scalingFactor && y > scalingFactor
            resizedImage(x, y, 1)=originalImage(1, round(y/scalingFactor), 1);
        elseif x > scalingFactor && y < scalingFactor
            resizedImage(x, y, 1)=originalImage(round(x/scalingFactor), 1, 1);
        else
%}