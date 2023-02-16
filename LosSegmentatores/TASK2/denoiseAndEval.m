clear all,clc
%% get all images list
dirCont = dir("V:\Ing\4. semestr\AB2\L1_23\Task2\images_noise");
imagesList = {dirCont.name}.';
imagesList = imagesList(4:end);
%% iterate through images and denoise
for i = 1:length(imagesList)
    noisyIm = imread(fullfile("V:\Ing\4. semestr\AB2\L1_23\Task2\images_noise",imagesList{i}));
    filteredIm = denoiseImageAB2(noisyIm);
    imwrite(filteredIm,fullfile("V:\Ing\4. semestr\AB2\L1_23\Task2\images_denoised",imagesList{i}))
end
%% run evaluation
evaluation_details = noise_eval('V:\Ing\4. semestr\AB2\L1_23\Task2\images_denoised\');