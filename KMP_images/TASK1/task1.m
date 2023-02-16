clc,clear all,close all
%% tast1_1
img_noise = rgb2gray(imread('Lenna_(noisy_image).png'));
img_org = rgb2gray(imread('Lenna_(original_image).png'));

figure
subplot(121)
imshow(img_noise)
title('noise')

subplot(122)
imshow(img_org)
title('org')
%% task1_2
PSNR_test = psnr(img_noise,img_org)

SSIM_test = ssim(img_noise,img_org)