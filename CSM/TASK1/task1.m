% MPA-AB2 Lecture1_23 Task1
% Muller, Sidlo, Chmela
% Loading data
% Converting to gray scale
close all; clear all; clc
imgNoise = rgb2gray(imread('images\Lenna_(noisy_image).png')); 
imgOrig = rgb2gray(imread('images\Lenna_(original_image).png'));
origPSNR = psnr(imgNoise,imgOrig);
%% Gaussian filter
imgGaussFilt= imgaussfilt(imgNoise,3);

figure(1)
imshow(imgGaussFilt)

gaussPSNR = psnr(imgGaussFilt,imgOrig);
gaussSSIM = ssim(imgGaussFilt,imgOrig);

%% Wiener filter

imgWiener = wiener2(imgNoise,[2 2]);

figure(2)
imshow(imgWiener);

wienPSNR = psnr(imgWiener,imgOrig);
wienSSIM = ssim(imgWiener,imgOrig);

%% Adaptive Wiener filter

imgAdWiener = wiener2(imgNoise,[5 5]);

figure(2)
imshow(imgAdWiener);

adWienPSNR = psnr(imgAdWiener,imgOrig);
adWienSSIM = ssim(imgAdWiener,imgOrig);

%% Bilateral filter

imgBilatFilt= imbilatfilt(imgNoise,20000,2);

figure(3)
imshow(imgBilatFilt)

bilatPSNR = psnr(imgBilatFilt,imgOrig);
bilatSSIM = ssim(imgBilatFilt,imgOrig);


%% Non-linear anisotropic diffusion filter

imgDiffFilt = imdiffusefilt(imgNoise,'ConductionMethod','quadratic','NumberOfIterations',13);
diffPSNR = psnr(imgDiffFilt,imgOrig);
diffSSIM = ssim(imgDiffFilt,imgOrig);
% Plotting
figure(4)
subplot(131)
imshow(imgOrig)
title('Original')
subplot(132)
imshow(imgNoise)
title('Noisy')
subplot(133)
imshow(imgDiffFilt)
title('Filtered')

%% Total variation filter

imgTvlFilt=uint8(255*(TVL1denoise(imgNoise, 1.5, 100)));

figure(5) 
imshow(imgTvlFilt, []);

tvlPSNR = psnr(imgTvlFilt,imgOrig);
tvlSSIM = ssim(imgTvlFilt,imgOrig);

%% NLM filter
imgNlmFilt = imnlmfilt(imgNoise);

figure(6)
imshow(imgNlmFilt);

nlmPSNR = psnr(imgNlmFilt,imgOrig);
nlmSSIM = ssim(imgNlmFilt,imgOrig);

%% Final plot

figure('WindowState','fullscreen')
subplot(241)
imshow(imgOrig)
title('Original Image')

subplot(242)
imshow(imgGaussFilt)
title({'Gaussian filter','PSNR:',num2str(gaussPSNR),'SSIM:',num2str(gaussSSIM)})

subplot(243)
imshow(imgWiener)
title({'Wiener filter','PSNR:',num2str(wienPSNR),'SSIM:',num2str(wienSSIM)})

subplot(244)
imshow(imgAdWiener)
title({'Wiener filter','PSNR:',num2str(adWienPSNR),'SSIM:',num2str(adWienSSIM)})


subplot(245)
imshow(imgBilatFilt)
title({'Bilateral filter','PSNR:',num2str(bilatPSNR),'SSIM:',num2str(bilatSSIM)})

subplot(246)
imshow(imgDiffFilt)
title({'Diffsuion filter','PSNR:',num2str(diffPSNR),'SSIM:',num2str(diffSSIM)})

subplot(247)
imshow(imgTvlFilt)
title({'Total Var filter','PSNR:',num2str(tvlPSNR),'SSIM:',num2str(tvlSSIM)})

subplot(248)
imshow(imgNlmFilt)
title({'NLM filter','PSNR:',num2str(nlmPSNR),'SSIM:',num2str(nlmSSIM)})


