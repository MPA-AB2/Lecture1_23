function filtredImage = denoiseImageAB2(noisyImage)
% Rozložení RGB obrazu na barevné kanály
[noisyR,noisyG,noisyB] = imsplit(noisyImage);
% Mediánová filtrace po filtraci NLM jednotlivých kanálů z různě velikým
% okolím
filtredImageR = medfilt2(imnlmfilt(noisyR),[9 9]);
filtredImageG = medfilt2(imnlmfilt(noisyG),[7 7]);
filtredImageB = medfilt2(imnlmfilt(noisyB),[15 15]);
% Složení do RGB obrazu
filtredImage = cat(3,filtredImageR,filtredImageG,filtredImageB);
end