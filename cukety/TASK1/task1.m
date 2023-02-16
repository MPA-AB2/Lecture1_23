clear all; close all

%% Load images 
im_noisy = rgb2gray(imread('Lecture1_first_data/Lenna_(noisy_image).png'));
im_orig = rgb2gray(imread('Lecture1_first_data/Lenna_(original_image).png'));

figure 
imshow(im_noisy)

%% Wiener filter based on equation 

% PSF = fspecial('disk',5);
% noise_mean = 0;
% noise_var = 0.001;
% signal_var = var(im2double(im_orig(:)));
% NSR = noise_var / signal_var;
% im_filt = deconvwnr(im_noisy,PSF,NSR);
% % figure
% % imshow(im_filt)
% % title('Restoration of Blurred Noisy Image (Estimated NSR)')
% figure
% subplot 131
% imshow(im_noisy)
% subplot 132
% imshow(im_filt)
% subplot 133
% imshow(im_orig)
% 
% wnr2 = deconvwnr(blurred_noisy,PSF);
% figure
% imshow(wnr2)
% title('Restoration of Blurred Noisy Image (NSR = 0)')
% 
% psnr_WF = ssim(im_filt, im_orig)
% ssim_WF = ssim(im_filt, im_orig)

%%  Adaptive WIener filter

im_filt = wiener2(J,[7 7]);
figure
subplot 131
imshow(im_noisy)
subplot 132
imshow(im_filt)
subplot 133
imshow(im_orig)

psnr_adaptWF = psnr(im_filt, im_orig)
ssim_adaptWF = ssim(im_filt, im_orig)

%% Non-Local Means

im_filt = imnlmfilt(im_noisy, 'DegreeOfSmoothing',27, 'SearchWindowSize', 21);

figure
subplot 131
imshow(im_noisy)
subplot 132
imshow(im_filt)
subplot 133
imshow(im_orig)

psnr_nlm = psnr(im_filt, im_orig)
ssim_nlm = ssim(im_filt, im_orig)

%% bilateral filter

im_filt = imbilatfilt(im_noisy,800,20);
peaksnr_bil = psnr(im_filt,im_orig)
ssimval_bil = ssim(im_filt,im_orig)
%score_bil = brisque(im_filt)
score_bil = niqe(im_filt)

figure;
subplot 131
imshow(im_noisy)
title("noisy")
subplot 132
imshow(im_orig)
title("orig")
subplot 133
imshow(im_filt)
title("filtered")

%% non-linear anisotropic diffusion filter

[gradientThreshold,numberOfIterations] = imdiffuseest(im_noisy);
im_filt = imdiffusefilt(im_noisy,"GradientThreshold",gradientThreshold,"NumberOfIterations",numberOfIterations);

peaksnr_ani = psnr(im_filt,im_orig)
ssimval_ani = ssim(im_filt,im_orig)
%score_ani = brisque(im_filt)
score_ani = niqe(im_filt)

figure;
subplot 131
imshow(im_noisy)
title("noisy")
subplot 132
imshow(im_orig)
title("orig")
subplot 133
imshow(im_filt)
title("filtered")



%% Gaussian filter

im_filt = imgaussfilt(im_noisy,3);
psnr1 = psnr(im_filt, im_orig);
ssim1 = ssim(im_filt, im_orig);

%% Total variation filter

im_filt2 = TVL1denoise(im_noisy, 1.0, 100);
im_filt2 = uint8(im_filt2 * 255);
psnr2 = psnr(im2double(im_filt2), im2double(im_orig));
ssim2 = ssim(im_filt2, im_orig);

%% %% zobrazeni a evaluace
% For total variation and gaussian

figure; subplot 311; imshow(im_noisy); 
subplot 312; imshow(im_filt); subplot 313; imshow(im_filt2, []);










