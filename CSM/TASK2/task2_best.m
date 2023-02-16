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
%% Trial

img1 = data{1,44};
img1RFilt = wiener2(img1(:,:,1),[30 30]);
figure(2)
subplot(121)
imshow(img1(:,:,1))
subplot(122)
imshow(img1RFilt)

%% Disp
img1 = data{1,44};
montage(img1)


%% Diffuse filt

imgNoise = data{1,1};
imgFilt = zeros(size(imgNoise));
dataFilt = cell(size(data));
for i = 1:55
    imgNoise = data{1,i};
    % R
    imgFilt(:,:,1) = imgaussfilt(imgNoise(:,:,1),10);
    % G
    imgFilt(:,:,2) = wiener2(imgNoise(:,:,2),[30 30]);
    % B
    imgFilt(:,:,3) = wiener2(imgNoise(:,:,3),[30 30]);

    imgFilt = cast(imgFilt,'uint8');
    dataFilt{1,i} = imgFilt;
end
%% Evaluation 
output_folder = 'C:\Kuba - Dokumenty\Osobní\VUT\MPA-AB2\Excercise\exc1\TASK2\images_filtered2';
load('fileNames.mat')
for i = 1:55
    outputFileName = fullfile(output_folder, fileNames(i,:));
    imwrite(dataFilt{1,i}, outputFileName);
end

%% Evaluation
evaluation = noise_eval('images_filtered2\');






