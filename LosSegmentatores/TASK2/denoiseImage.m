function denoisedImage = denoiseImage(pathToNoisyImage)
    noisyIm = imread(pathToNoisyImage);
    filteredIm = imnlmfilt(noisyIm,"DegreeOfSmoothing",,"ComparisonWindowSize",,"SearchWindowSize",)
end