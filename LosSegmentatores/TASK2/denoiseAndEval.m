clear all,clc
%% get all images list
dirCont = dir('V:\MPA-AB2\Lecture1_23\images_noise');
imagesList = {dirCont.name}.';
%% iterate through images
for i = 1:length(imagesList)
    noisyIm = 
end