%% Load dataset info
path = 'images_noise';
images = dir(fullfile(path, '*.jpg'));
numOfIm = length(images);

% Create output dir
outDir = 'denoised_images\';
if ~exist(outDir,'dir')
    mkdir(outDir);
end

% Filter all images
for i = 1:numOfIm
    
    im = imread(images(i).name);
    imSmall = imresize(im, 0.25);
    imFilt = imnlmfilt(imSmall, 'DegreeOfSmoothing', 40, 'SearchWindowSize', 15);
    imFilt = imbilatfilt(imFilt, 1000);
    imFilt = imflatfield(imFilt, 25);
    imFilt = imresize(imFilt, 4);
    
    % Save filtered image
    imwrite(imFilt,[outDir, '\', images(i).name])
end


%% Evaluate
results = noise_eval(outDir);


