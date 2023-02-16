path_to_noised_images = "Lecture1_second_data\images_noise";

myFiles = dir(fullfile(path_to_noised_images,'*.jpg')); %gets all wav files in struct
if ~exist("images_denoised\", 'dir')
    mkdir("images_denoised\")
end
for k = 1:length(myFiles)
    baseFileName = myFiles(k).name;
    fullFileName = fullfile(myFiles(k).folder, baseFileName);
    fprintf(1, 'Now reading %s\n', fullFileName);
    im = imread(fullFileName);
    
    sig = 25;
    RGB = cell(1,3);
    for i = 1:3
        chan = im(:,:,i);
        chan_filt = imdiffusefilt(chan, "NumberOfIterations", 50);
        RGB{i} = chan_filt;
    end
    result = cat(3, RGB{1}, RGB{2}, RGB{3});
    imwrite(result, strcat("images_denoised\", baseFileName))
end
x = noise_eval('V:\AB2\MAIN\Lecture1_23\MED\TASK2\images_denoised\')