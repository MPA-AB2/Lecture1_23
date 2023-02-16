function [psnr_value] = psnr(image1,image2)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
MAX_INTENSITY = 255;
diff = image1 - image2;
mse = mean(mean(mean(diff.^2)));
psnr_value = 10 * log10(MAX_INTENSITY^2/mse);
end