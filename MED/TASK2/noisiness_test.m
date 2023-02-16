path_to_noised_images = "Lecture1_second_data\images_noise";

myFiles = dir(fullfile(path_to_noised_images,'*.jpg')); %gets all wav files in struct
if ~exist("images_denoised\", 'dir')
    mkdir("images_denoised\")
end

for k = 1:11

    baseFileName = myFiles(k).name;
    fullFileName = fullfile(myFiles(k).folder, baseFileName);
    fprintf(1, 'Now reading %s\n', fullFileName);
    im = imread(fullFileName);
    disp(noisiness(im))

end


