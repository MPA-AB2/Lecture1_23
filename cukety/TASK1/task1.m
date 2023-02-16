clear all; close all

%% Load images 
% im_noisy = rgb2gray(imread('Lecture1_first_data/Lenna_(noisy_image).png'));
% im_orig = rgb2gray(imread('Lecture1_first_data/Lenna_(original_image).png'));
im_noisy = rgb2gray(imread('Lenna_(noisy_image).png'));
im_orig = rgb2gray(imread('Lenna_(original_image).png'));
% figure 
% imshow(im_noisy)

%% Gaussian filter

im_filt_gauss = imgaussfilt(im_noisy,3);
psnr_gauss = psnr(im_filt_gauss, im_orig);
ssim_gauss = ssim(im_filt_gauss, im_orig);

%% Wiener filter based on equation 

PSF = fspecial('disk',5);
noise_mean = 0;
noise_var = 0.01;
signal_var = var(im2double(im_orig(:)));
NSR = noise_var / signal_var;
im_filt_WF = deconvwnr(im_noisy,PSF,NSR);
% figure
% imshow(im_filt)
% title('Restoration of Blurred Noisy Image (Estimated NSR)')
% figure
% subplot 131
% imshow(im_noisy)
% subplot 132
% imshow(im_filt_WF)
% subplot 133
% imshow(im_orig)

% wnr2 = deconvwnr(blurred_noisy,PSF);
% figure
% imshow(wnr2)
% title('Restoration of Blurred Noisy Image (NSR = 0)')

psnr_WF = psnr(im_filt_WF, im_orig)
ssim_WF = ssim(im_filt_WF, im_orig)

%%  Adaptive WIener filter

im_filt_adapt = wiener2(im_noisy,[7 7]);
% figure
% subplot 131
% imshow(im_noisy)
% subplot 132
% imshow(im_filt)
% subplot 133
% imshow(im_orig)

psnr_adaptWF = psnr(im_filt_adapt, im_orig)
ssim_adaptWF = ssim(im_filt_adapt, im_orig)

%% bilateral filter
close all
im_filt_bilat = imbilatfilt(im_noisy,16000,2);
psnr_bil = psnr(im_filt_bilat,im_orig)
ssim_bil = ssim(im_filt_bilat,im_orig)
%score_bil = brisque(im_filt)
score_bil = niqe(im_filt_bilat)

figure;
subplot 131
imshow(im_noisy)
title("noisy")
subplot 132
imshow(im_orig)
title("orig")
subplot 133
imshow(im_filt_bilat)
title("filtered")

%% non-linear anisotropic diffusion filter

[gradientThreshold,numberOfIterations] = imdiffuseest(im_noisy);
im_filt_aniso = imdiffusefilt(im_noisy,"GradientThreshold",gradientThreshold,"NumberOfIterations",numberOfIterations);

psnr_ani = psnr(im_filt_aniso,im_orig)
ssim_ani = ssim(im_filt_aniso,im_orig)
%score_ani = brisque(im_filt)
score_ani = niqe(im_filt_aniso)

% figure;
% subplot 131
% imshow(im_noisy)
% title("noisy")
% subplot 132
% imshow(im_orig)
% title("orig")
% subplot 133
% imshow(im_filt)
% title("filtered")



%% Total variation filter

im_filt_TV = TVL1denoise(im_noisy, 1.0, 100);
im_filt_TV = uint8(im_filt_TV * 255);
psnr_TV = psnr(im2double(im_filt_TV), im2double(im_orig));
ssim_TV = ssim(im_filt_TV, im_orig);

%% Non-Local Means

im_filt_NLM = imnlmfilt(im_noisy, 'DegreeOfSmoothing',27, 'SearchWindowSize', 21);

% figure
% subplot 131
% imshow(im_noisy)
% subplot 132
% imshow(im_filt)
% subplot 133
% imshow(im_orig)

psnr_nlm = psnr(im_filt_NLM, im_orig)
ssim_nlm = ssim(im_filt_NLM, im_orig)


%% Zobrazeni 
figure; 
subplot 241; imshow(im_filt_gauss); title(['Gaussian filter - PSNR: ' num2str(psnr_gauss)  ', SSIM: '  num2str(ssim_gauss)]);
subplot 242; imshow(im_filt_WF); title(['Wiener filter - PSNR: ' num2str(psnr_WF) ', SSIM: ' num2str(ssim_WF)]);
subplot 243; imshow(im_filt_adapt); title(['Adaptive wiener filter - PSNR: ' num2str(psnr_adaptWF) ', SSIM: ' num2str(ssim_adaptWF)]);
subplot 244; imshow(im_filt_bilat); title(['Bilateral filter - PSNR: ' num2str(psnr_bil) ', SSIM: ' num2str(ssim_bil)]);
subplot 245; imshow(im_filt_aniso); title(['NLA diffusion filter - PSNR: ' num2str(psnr_ani) ', SSIM: ' num2str(ssim_ani)]);
subplot 246; imshow(im_filt_TV); title(['TV filter - PSNR: ' num2str(psnr_TV) ', SSIM: ' num2str(ssim_TV)]);
subplot 247; imshow(im_filt_NLM); title(['Non-local means filter - PSNR: ' num2str(psnr_nlm) ', SSIM: ' num2str(ssim_nlm)]);

% ULOZENI TIFF
% imagewd = getframe(gcf); 
% imwrite(imagewd.cdata, 'TASK1.tiff');


