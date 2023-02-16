close all;

noisy_image=imread('Lenna_(noisy_image).png');
original_image=imread('Lenna_(original_image).png');

ni_g=rgb2gray(noisy_image);
oi_g=rgb2gray(original_image);

figure
imshow(ni_g)

%% Mean filter 1
mean_im = imboxfilt(ni_g,5);
figure
imshow(mean_im)

%% Wiener 2
wiener_im = wiener2(ni_g,[5 5]);
figure
imshow(wiener_im)

%% Bilateral 3
patchVar = std2(ni_g)^2;
DoS = 2*patchVar;
bilateral_im = imbilatfilt(ni_g,DoS);
figure
imshow(bilateral_im)

%% Non-linear anisotropic diffusion 4
nonlineanidif = imdiffusefilt(ni_g);
figure
imshow(nonlineanidif)

%% TVL1denoise(im, lambda, niter) 5
tvl1=TVL1denoise(ni_g, 0.8,10);
tvl1=im2uint8(tvl1);
figure
imshow(tvl1)

%% imnimnlmfilt
imnlmfilt_im=imnlmfilt(ni_g);
imshow(imnlmfilt_im)



