addpath('Lecture1_first_data')

imNoise = rgb2gray(imread('Lenna_(noisy_image).png'));
imOrig = rgb2gray(imread('Lenna_(original_image).png'));

figure;
subplot 331, imshow(imNoise), title('Noisy image')
subplot 332, imshow(imOrig), title('Original image')


%% Image quality assessment
evaluate(imNoise, imOrig);


%% Filtering
imGauss = imgaussfilt(imNoise, 'FilterSize', [5 5]);
evaluate(imGauss, imOrig)
subplot 333, imshow(imGauss), title('Gaussian filter')

imWienerAdapt = wiener2(imNoise, [5 5]);
evaluate(imWienerAdapt, imOrig)
subplot 334, imshow(imWienerAdapt), title('Adaptive wiener filter')

imBilat = imbilatfilt(imNoise, 10000);
evaluate(imBilat, imOrig)
subplot 335, imshow(imBilat), title('Bilateral filter')

imAniso = imdiffusefilt(imNoise, 'GradientThreshold', 50);
evaluate(imAniso, imOrig)
subplot 336, imshow(imAniso), title('Anisotropic diffusion filter')

imTVL1 = TVL1denoise(imNoise, 1.0, 50);
evaluate(uint8(imTVL1), imOrig)
subplot 337, imshow(imTVL1), title('Total variation filter')

imNLM = imnlmfilt(imNoise,'SearchWindowSize', 15);
evaluate(imNLM, imOrig)
subplot 338, imshow(imNLM), title('NLM filter')


