noisy = imread("Lecture1_first_data\Lenna_(noisy_image).png");
original = imread("Lecture1_first_data\Lenna_(original_image).png");

psnr(noisy, original)