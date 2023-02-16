% Loading data
% Converting to gray scale
close all; clear all; clc

data=cell(1,55);
k=1;
for i=1:5
    for j=1:11 
        if j<10
        nazev= ['image' num2str(i) '_0' num2str(j) '.jpg' ];
        else
        nazev= ['image' num2str(i) '_' num2str(j) '.jpg' ];
        end
        image= imread(['images_noise/',nazev]);
        data{1,k}=image;
        k=k+1;
    end

end
%% 
net = denoisingNetwork('DnCNN');

%%
[r,s]=size(data);
data_filtered=cell(size(data));
for i=1:s
image_noisy= data{1,i};

image_noisy = (imresize(image_noisy, [512 768], "nearest"));
[noisyR,noisyG,noisyB] = imsplit(image_noisy);
denoisedR = denoiseImage(noisyR,net);
denoisedG = denoiseImage(noisyG,net);
denoisedB = denoiseImage(noisyB,net);
denoisedRGB = cat(3,denoisedR,denoisedG,denoisedB);
B = imresize(denoisedRGB, [3072 4608], "nearest");
data_filtered{1,i}=B;
end

%% Get names
fileNames = ls;
fileNames = fileNames(4:end,:);

%%
output_folder = 'C:\Kuba - Dokumenty\Osobní\VUT\MPA-AB2\Excercise\exc1\TASK2\images_filtered';
for i = 1:55
    outputFileName = fullfile(output_folder, fileNames(i,:));
    imwrite(data_filtered{1,i}, outputFileName);
end

%% Evaluation 
evaluation = noise_eval('images_filtered\');


