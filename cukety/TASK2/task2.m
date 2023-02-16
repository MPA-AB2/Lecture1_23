% clear all
% close all
% clc
%% Set paths

pth_noise_img = "/home/zanetka/Documents/schola/AB2/data/Lecture1_second_data/images_noise";
pth_save_filt = "/home/zanetka/Documents/schola/AB2/data/Lecture1_second_data/denoised_img";
zavorka = "/";


%%

obr = dir(pth_noise_img);
for i = 4:size(obr, 1)
%     i = 4;
    im = imread([obr(i).folder + zavorka + obr(i).name]);

%     figure(1);
%     imshow(im)
%     im = rgb2gray(im);
%     disp(i)
    imR = im(:,:,1);
    imG = im(:,:,2);
    imB = im(:,:,3);

 im_filtR = imdiffusefilt(imR);
    im_filtR = imnlmfilt(imR,"DegreeOfSmoothing",27,"SearchWindowSize",21);
    im_filtR = imdiffusefilt(im_filtR);

%     im_filtG = imdiffusefilt(imG);
    im_filtG = imnlmfilt(imG,"DegreeOfSmoothing",27,"SearchWindowSize",21);
    im_filtG = imdiffusefilt(im_filtG);

%     im_filtB = imdiffusefilt(imB);
    im_filtB = imnlmfilt(imB,"DegreeOfSmoothing",27,"SearchWindowSize",21);
    im_filtB = imdiffusefilt(im_filtB);
% 
%     figure(2);
%     subplot 231
%     imshow(imR)
%     title("r-orig")
%     subplot 232
%     imshow(imG)
%     title("g-orig")
%     subplot 233
%     imshow(imB)
%     title("b-orig")
% 
%     subplot 234
%     imshow(im_filtR)
%     title("r-filt")
%     subplot 235
%     imshow(im_filtB)
%     title("b-filt")
%     subplot 236
%     imshow(im_filtG)
%     title("g-filt")

    new_im = im;
    new_im(:,:,1) = im_filtR;
    new_im(:,:,2) = im_filtG;
    new_im(:,:,3) = im_filtB;
    
%     figure(3);
%     imshow(new_im)
     imwrite(new_im, pth_save_filt + zavorka + obr(i).name)
%     disp(i)
end

%%
evaluation_details = noise_eval('/home/zanetka/Documents/schola/AB2/data/Lecture1_second_data/denoised_img/')
