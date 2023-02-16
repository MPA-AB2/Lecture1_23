function filtredImage = denoiseImageAB2(noisedIm)

%% Gausian filtering
sigma = 0.8;
image1 = imgaussfilt(noisedIm,sigma);

%% bilateral filter
image3 = imbilatfilt(noisedIm,250,1.1);

%% NLM
[image4,~] = imnlmfilt(noisedIm);
% průměrování vyfiltrovaných obrzů a jejich mediánová filtrace v
% jednotlivých kanálech
Im = (image1+image3+image4)/3;
[noisyR,noisyG,noisyB] = imsplit(Im);
filtredImageR = medfilt2(noisyR,[9 9]);
filtredImageG = medfilt2(noisyG,[7 7]);
filtredImageB = medfilt2(noisyB,[15 15]);
filtredImage = cat(3,filtredImageR,filtredImageG,filtredImageB);

end