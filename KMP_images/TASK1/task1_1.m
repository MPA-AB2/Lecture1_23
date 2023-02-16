% TASK1...vsechny fce a ukoly
clc,clear all,close all
%% nacteni dat
obr_noisy = imread('Lenna_(noisy_image).png');
obr_orig = imread('Lenna_(original_image).png');

obr_noisy = rgb2gray(obr_noisy);
obr_orig = rgb2gray(obr_orig);

%%
%PSNR
peaksnr = psnr(obr_noisy, obr_orig);
%SSIM
ssimval = ssim(obr_noisy, obr_orig);

%%
%gaussovsky filtr, sigma = 0.5
obr_gaussian = imgaussfilt(obr_noisy);

psnr_gaussian = psnr(obr_gaussian, obr_orig);
ssimval_gaussian = ssim(obr_gaussian, obr_orig);
figure
subplot(241)
imshow(obr_gaussian)
title(['psnr = ',num2str(psnr_gaussian),', ','ssim = ', num2str(ssimval_gaussian)])
%%
%wieneruv filtr
noise = abs(obr_orig-obr_noisy);
[s,d] = size(obr_orig);
vn = std2(noise)^2;
obr_wiener = zeros(s-1,d-1);
win_size = 3;
for i=1:s-win_size - 1
    for j=1:s - win_size - 1
        win = obr_noisy(i:i+win_size,j:j+win_size);
        ux = mean(mean(win));
        vx = std2(win)^2;
        obr_wiener(i,j) = ux + (obr_noisy(i,j)-ux)*(vx/(vx+vn));
    end
end
test=obr_wiener;
obr_wiener=uint8(obr_wiener);
psnr_wiener = psnr(obr_wiener, obr_orig(1:s-1,1:d-1));
ssimval_wiener = ssim(obr_wiener, obr_orig(1:s-1,1:d-1));

subplot(242)
imshow(obr_wiener)
title(['psnr = ',num2str(psnr_wiener),', ','ssim = ', num2str(ssimval_wiener)])
%%
%adaptive wiener
adawiener = wiener2(obr_noisy,[5 5]);

%PSNR
snr_adawiener = psnr(adawiener, obr_orig);
%SSIM
ssimval_adawiener = ssim(adawiener, obr_orig);

subplot(243)
imshow(adawiener)
title(['psnr = ',num2str(snr_adawiener),', ','ssim = ', num2str(ssimval_adawiener)])
%%
%bilateral
bilateral = imbilatfilt(obr_noisy);

%PSNR
snr_bilateral = psnr(bilateral, obr_orig);
%SSIM
ssimval_bilateral = ssim(bilateral, obr_orig);

subplot(244)
imshow(bilateral)
title(['psnr = ',num2str(snr_bilateral),', ','ssim = ', num2str(ssimval_bilateral)])
%%
%nonlinear anisotropic diffusion
nlad = imdiffusefilt(obr_noisy);

%PSNR
snr_nlad = psnr(nlad, obr_orig);
%SSIM
ssimval_nlad = ssim(nlad, obr_orig);

subplot(245)
imshow(nlad)
title(['psnr = ',num2str(snr_nlad),', ','ssim = ', num2str(ssimval_nlad)])
%%
%tvl1
tvl1 = im2double(obr_noisy);
tvl1 = TVL1denoise(tvl1,1.0, 100);
tvl1 = uint8(tvl1.*255);

%PSNR
snr_tvl1 = psnr(tvl1, obr_orig);
%SSIM
ssimval_tvl1 = ssim(tvl1, obr_orig);

subplot(246)
imshow(tvl1)
title(['psnr = ',num2str(snr_tvl1),', ','ssim = ', num2str(ssimval_tvl1)])
%%
%non-local means (NLM) filter
nlmfilt = imnlmfilt(obr_noisy);

%PSNR
snr_nlm = psnr(nlmfilt, obr_orig);
%SSIM
ssimval_nlm = ssim(nlmfilt, obr_orig);

subplot(247)
imshow(nlmfilt)
title(['psnr = ',num2str(snr_nlm),', ','ssim = ', num2str(ssimval_nlm)])