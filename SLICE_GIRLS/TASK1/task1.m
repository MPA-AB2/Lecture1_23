addpath('Lecture1_first_data')

imNoise = rgb2gray(imread('Lenna_(noisy_image).png'));
imOrig = rgb2gray(imread('Lenna_(original_image).png'));

figure;
subplot 131, imshow(imNoise)
subplot 132, imshow(imOrig)


%% Image quality assessment
imPSNR = psnr(imNoise,imOrig);
imSSIM = ssim(imNoise,imOrig);
imPIQE = piqe(imNoise);

