close all

noisy = imread("Lecture1_first_data\Lenna_(noisy_image).png");
original = imread("Lecture1_first_data\Lenna_(original_image).png");

disp("PSNR:")
disp(psnr(noisy, original))
disp("SSIM:")
disp(getSSim(original, noisy))
disp("PIQE:")
disp(piqe(noisy))

noisy_gray = rgb2gray(noisy);

filtered_gaussian = imgaussfilt(noisy_gray, 2);

filtered_wiener = wiener2(noisy_gray, [10,2]);

filtered_bilateral = imbilatfilt(noisy_gray, 100000);

filtered_aniso_diffusion = imdiffusefilt(noisy_gray);

filtered_total_variation = TVL1denoise(noisy_gray, 1.2);

filtered_nlm = imnlmfilt(noisy_gray);

figure
imshow(im2gray(original))
piqe_val = piqe(im2gray(original));
title(["Original, PIQE:" num2str(piqe_val)])
figure
imshow(noisy_gray)
piqe_val = piqe(noisy_gray);
psnr_val = psnr(noisy_gray, original);
ssim_val = ssim(noisy_gray, original);
title("Noisy")
figure
imshow(filtered_gaussian)
piqe_val = piqe(filtered_gaussian);
psnr_val = psnr(filtered_gaussian, original);
ssim_val = ssim(filtered_gaussian, original);
title("Gaussian")
figure
imshow(filtered_wiener)
title("Wiener")
figure
imshow(filtered_bilateral)
title("Bilateral")
figure
imshow(filtered_aniso_diffusion)
title("Anisotropic Diffusion")
figure
imshow(filtered_total_variation)
title("Total variation")
figure
imshow(filtered_nlm)
title("Non-local Means")