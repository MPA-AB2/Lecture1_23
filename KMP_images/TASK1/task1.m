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

%% task1_3...bilateral filt.
% figure
% imshow(img_noise)
% PatchV=[];
% %for i=1:3
%     patch = drawrectangle("FixedAspectRatio",1);
%     PatchV = [PatchV img_noise(patch.Position(1):patch.Position(1)+patch.Position(3),patch.Position(2):patch.Position(2)+patch.Position(4))];
% %end
% V = std2(PatchV)^2;
% bilfilt = imbilatfilt(img_noise,V);
% figure
% imshow(bilfilt)

%% task1_3...wiener filt.
close all
noise = abs(img_org-img_noise);
[s,d] = size(img_org);
vn = std2(noise)^2;
img_filt = zeros(s-1,d-1);
win_size = 3;
for i=1:s-win_size - 1
    for j=1:s - win_size - 1
        win = img_noise(i:i+win_size,j:j+win_size);
        ux = mean(mean(win));
        vx = std2(win)^2;
        img_filt(i,j) = ux + (img_noise(i,j)-ux)*(vx/(vx+vn));
    end
end
% figure
% imshow(noise)
figure
imshow(img_filt,[])
img_filt=uint8(img_filt.*255);
PSNR_test = psnr(img_filt,img_org(1:s-1,1:d-1))

SSIM_test = ssim(img_filt,img_org(1:s-1,1:d-1))
