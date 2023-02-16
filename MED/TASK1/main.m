noisy = imread("Lecture1_first_data\Lenna_(noisy_image).png");
original = imread("Lecture1_first_data\Lenna_(original_image).png");

disp("PSNR:")
disp(psnr(noisy, original))
disp("SSIM:")
disp(getSSim(original, noisy))
disp("PIQE:")
disp(piqe(noisy))