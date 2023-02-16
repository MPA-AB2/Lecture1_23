%% Obtaining evaluation metrics
clear
clc
noisedIm = rgb2gray(imread('Lenna_(noisy_image).png'));
clearIm = rgb2gray(imread('Lenna_(original_image).png'));
Comp = zeros(8,3);
[Comp(1,1),Comp(1,2),Comp(1,3)] = EvalMet(noisedIm,clearIm);

%% Gausian filtering
sigma = 0.8;
image1 = imgaussfilt(noisedIm,sigma);
im{1} = image1;
[Comp(2,1),Comp(2,2),Comp(2,3)] = EvalMet(image1,clearIm);
%% Wiener filtering
SizeNeigh = 3;
[image7,~] = wiener2(noisedIm,[SizeNeigh SizeNeigh]);
im{7} = image7;
[Comp(8,1),Comp(8,2),Comp(8,3)] = EvalMet(image7,clearIm);
%% Wiener adaptive filtering
SizeNeigh = 3;
[image2,~] = wiener2(noisedIm,[SizeNeigh SizeNeigh],mean2(var(double(noisedIm(480:510,320:350)))));
im{2} = image2;
[Comp(3,1),Comp(3,2),Comp(3,3)] = EvalMet(image2,clearIm);
%% bilateral filter
image3 = imbilatfilt(noisedIm,250,1.1);
im{3} = image3;
[Comp(4,1),Comp(4,2),Comp(4,3)] = EvalMet(image3,clearIm);
%% anisotropic diffusion
[gradientThreshold,numberOfIterations] = imdiffuseest(noisedIm);
image4 = imdiffusefilt(noisedIm,"GradientThreshold",gradientThreshold,"NumberOfIterations",numberOfIterations);
im{4} = image4;
[Comp(5,1),Comp(5,2),Comp(5,3)] = EvalMet(image4,clearIm);
%% total variation denoising
filteredImTV = TVL1denoise(noisedIm, 1.5, 100);
image5 = uint8(round(filteredImTV*255));
im{5} = image5;
[Comp(6,1),Comp(6,2),Comp(6,3)] = EvalMet(image5,clearIm);
%% NLM
[image6,~] = imnlmfilt(noisedIm);
im{6} = image6;
[Comp(7,1),Comp(7,2),Comp(7,3)] = EvalMet(image6,clearIm);
%% Vizualization
Comp
Name = {'Gaus','Wiener-adap','Bilat','Anisotripic','TotalV','NLM','Wiener'};
figure
for i = 1:7
    subplot(2,4,i)
    imshow(im{i})
    title([Name{i} ': PSRN-' num2str(Comp(i+1,1)) ': SSIM-' num2str(Comp(i+1,2)) ': PIQE-' num2str(Comp(i+1,3))])
end



