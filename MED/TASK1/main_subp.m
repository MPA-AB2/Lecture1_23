close all

noisy = imread("Lecture1_first_data\Lenna_(noisy_image).png");
original = imread("Lecture1_first_data\Lenna_(original_image).png");
original_gray = im2gray(original);

disp("PSNR:")
disp(psnr(noisy, original))
disp("SSIM:")
disp(getSSim(original, noisy))
disp("PIQE:")
disp(piqe(noisy))

noisy_gray = rgb2gray(noisy);
piqe_val1 = num2str(piqe(noisy_gray));
psnr_val1 = num2str(psnr(noisy_gray, original_gray));
ssim_val1 = num2str(ssim(noisy_gray, original_gray));

filtered_gaussian = imgaussfilt(noisy_gray, 2);
piqe_val2 = num2str(piqe(filtered_gaussian));
psnr_val2 = num2str(psnr(filtered_gaussian, original_gray));
ssim_val2 = num2str(ssim(filtered_gaussian, original_gray));

filtered_wiener = wiener2(noisy_gray, [10,2]);
piqe_val3 = num2str(piqe(filtered_wiener));
psnr_val3 = num2str(psnr(filtered_wiener, original_gray));
ssim_val3 = num2str(ssim(filtered_wiener, original_gray));

filtered_bilateral = imbilatfilt(noisy_gray, 100000);
piqe_val4 = num2str(piqe(filtered_bilateral));
psnr_val4 = num2str(psnr(filtered_bilateral, original_gray));
ssim_val4 = num2str(ssim(filtered_bilateral, original_gray));

filtered_aniso_diffusion = imdiffusefilt(noisy_gray);
piqe_val5 = num2str(piqe(filtered_aniso_diffusion));
psnr_val5 = num2str(psnr(filtered_aniso_diffusion, original_gray));
ssim_val5 = num2str(ssim(filtered_aniso_diffusion, original_gray));

filtered_total_variation = im2uint8(TVL1denoise(noisy_gray, 1.2));
piqe_val6 = num2str(piqe(filtered_total_variation));
psnr_val6 = num2str(psnr(filtered_total_variation, original_gray));
ssim_val6 = num2str(ssim(filtered_total_variation, original_gray));

filtered_nlm = imnlmfilt(noisy_gray);
piqe_val7 = num2str(piqe(filtered_nlm));
psnr_val7 = num2str(psnr(filtered_nlm, original_gray));
ssim_val7 = num2str(ssim(filtered_nlm, original_gray));

% figure
% imshow(im2gray(original))
% piqe_val = piqe(im2gray(original));
% title(["Original, PIQE:" num2str(piqe_val)])
% figure
% imshow(noisy_gray)
% piqe_val = piqe(noisy_gray);
% psnr_val = psnr(noisy_gray, original);
% ssim_val = ssim(noisy_gray, original);
% title("Noisy")
% figure
% imshow(filtered_gaussian)
% piqe_val = piqe(filtered_gaussian);
% psnr_val = psnr(filtered_gaussian, original);
% ssim_val = ssim(filtered_gaussian, original);
% title("Gaussian")
% figure
% imshow(filtered_wiener)
% title("Wiener")
% figure
% imshow(filtered_bilateral)
% title("Bilateral")
% figure
% imshow(filtered_aniso_diffusion)
% title("Anisotropic Diffusion")
% figure
% imshow(filtered_total_variation)
% title("Total variation")
% figure
% imshow(filtered_nlm)
% title("Non-local Means")


figure
subplot 241
imshow(im2gray(original))
title("Original")
subplot 242
imshow(noisy_gray)
title(strcat("Noisy,  PIQE:", piqe_val1," PSNR:", psnr_val1," SSIM: ", ssim_val1))
subplot 243
imshow(filtered_gaussian)
title(strcat("Gaussian,  PIQE:", piqe_val2," PSNR:", psnr_val2," SSIM: ", ssim_val2))
subplot 244
imshow(filtered_wiener)
title(strcat("Wiener,  PIQE:", piqe_val3," PSNR:", psnr_val3," SSIM: ", ssim_val3))
subplot 245
imshow(filtered_bilateral)
title(strcat("Bilateral,  PIQE:", piqe_val4," PSNR:", psnr_val4," SSIM: ", ssim_val4))
subplot 246
imshow(filtered_aniso_diffusion)
title(strcat("Anisotropic Diffusion,  PIQE:", piqe_val5," PSNR:", psnr_val5," SSIM: ", ssim_val5))
subplot 247
imshow(filtered_total_variation)
title(strcat("Total variation, PIQE:", piqe_val6," PSNR:", psnr_val6," SSIM: ", ssim_val6))
subplot 248
imshow(filtered_nlm)
title(strcat("Non-local Means, PIQE:", piqe_val7," PSNR:", psnr_val7," SSIM: ", ssim_val7))