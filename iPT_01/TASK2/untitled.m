for ii = 1:11
    FN = strcat('V:\AB2\Lecture1_23\iPT_01\TASK2\Lecture1_second_data\images_noise\image1_',num2str(ii.','%02d'), '.jpg');
    prvni{ii} = imread(FN);
end
for ii = 1:11
    FN = strcat('V:\AB2\Lecture1_23\iPT_01\TASK2\Lecture1_second_data\images_noise\image2_',num2str(ii.','%02d'), '.jpg');
    druhe{ii} = imread(FN);
end
for ii = 1:11
    FN = strcat('V:\AB2\Lecture1_23\iPT_01\TASK2\Lecture1_second_data\images_noise\image3_',num2str(ii.','%02d'), '.jpg');
    treti{ii} = imread(FN);
end
for ii = 1:11
    FN = strcat('V:\AB2\Lecture1_23\iPT_01\TASK2\Lecture1_second_data\images_noise\image4_',num2str(ii.','%02d'), '.jpg');
    ctvrte{ii} = imread(FN);
end
for ii = 1:11
    FN = strcat('V:\AB2\Lecture1_23\iPT_01\TASK2\Lecture1_second_data\images_noise\image5_',num2str(ii.','%02d'), '.jpg');
    pate{ii} = imread(FN);
end
% %% wiener
% for i = 1:11
%     mean_im{1,i}(:,:,1) = wiener2((D{1,i}(:,:,1)),[12,12]);
%     mean_im{1,i}(:,:,2) = wiener2((D{1,i}(:,:,2)),[12,12]);
%     mean_im{1,i}(:,:,3) = wiener2((D{1,i}(:,:,3)),[12,12]);
% end

%% NLM
noisyLAB = rgb2lab(prvni{1,5});


roi = [210,24,52,41];
patch = imcrop(noisyLAB,roi);

patchSq = patch.^2;
edist = sqrt(sum(patchSq,3));
patchSigma = sqrt(var(edist(:)));

DoS = 1.5*patchSigma;
denoisedLAB = imnlmfilt(noisyLAB,'DegreeOfSmoothing',DoS);


denoisedRGB = lab2rgb(denoisedLAB,'Out','uint8');
figure
imshow(denoisedRGB)
figure
imshow(prvni{1,5})

%% Non-linear anisotropic diffusion - better


[gradThresh,numIter] = imdiffuseest(prvni{1,5}(:,:,1),'ConductionMethod','quadratic');
C(:,:,1) = imdiffusefilt(prvni{1,5}(:,:,1),'ConductionMethod','quadratic', ...
    'GradientThreshold',gradThresh,'NumberOfIterations',numIter);

[gradThresh,numIter] = imdiffuseest(prvni{1,5}(:,:,2),'ConductionMethod','quadratic');
C(:,:,2) = imdiffusefilt(prvni{1,5}(:,:,2),'ConductionMethod','quadratic', ...
    'GradientThreshold',gradThresh,'NumberOfIterations',numIter);

[gradThresh,numIter] = imdiffuseest(prvni{1,5}(:,:,3),'ConductionMethod','quadratic');
C(:,:,3) = imdiffusefilt(prvni{1,5}(:,:,3),'ConductionMethod','quadratic', ...
    'GradientThreshold',gradThresh,'NumberOfIterations',numIter);
figure
imshow(C)











% for i = 1:11
%     mean_im{1,i}(:,:,1) = wiener2((D{1,i}(:,:,1)),[12,12]);
%     mean_im{1,i}(:,:,2) = wiener2((D{1,i}(:,:,2)),[12,12]);
%     mean_im{1,i}(:,:,3) = wiener2((D{1,i}(:,:,3)),[12,12]);
% end

%%
for ii = 1:11
    FN = strcat('image1_',num2str(ii.','%02d'), '.jpg');
    imwrite(mean_im{1,ii},FN)
end




