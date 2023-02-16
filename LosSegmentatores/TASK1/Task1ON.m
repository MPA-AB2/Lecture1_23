%% Obtaining evaluation metrics
noisedIm = rgb2gray(imread('Lenna_(noisy_image).png'));
clearIm = rgb2gray(imread('Lenna_(original_image).png'));
[PSNR,SSIM,PIQE] = EvalMet(noisedIm,clearIm);
%%