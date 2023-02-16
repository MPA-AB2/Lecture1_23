function [PSNR,SSIM,PIQE] = EvalMet(image,ref)
    % This is evaluation function 
    PSNR = psnr(image, ref);
    SSIM = ssim(image,ref);
    PIQE = piqe(image);
end


