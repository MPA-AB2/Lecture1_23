function [result] = noisiness(im)
%UNTITLED14 Summary of this function goes here
%   Detailed explanation goes here
    [h, w, ~] = size(im);
    k_size = 40;
    stride = 40;
    std_averages = [];
    for r = 1:stride:(h-k_size + 1)
        for c = 1:stride:(w-k_size + 1)
            std_r = std(double(im(r:r+k_size-1,c:c+k_size-1, 1)));
            std_g = std(double(im(r:r+k_size-1,c:c+k_size-1, 2)));
            std_b = std(double(im(r:r+k_size-1,c:c+k_size-1, 3)));
            std_averages = [std_averages mean([std_r, std_g, std_b])];
        end
    end
    result = mean(std_averages);
    %disp(result)
end