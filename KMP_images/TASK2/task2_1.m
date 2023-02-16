%%
%nacteni obrazu
cesta = 'V:\main\Lecture1_23\images_noise\image';
for i=1:5;
    for j=1:11
        if j<10
            nazev = [cesta int2str(i)  '_' '0' int2str(j) '.jpg'];
        else
            nazev = [cesta int2str(i)  '_' int2str(j) '.jpg'];
        end
    obr = imread(nazev); %'V:\main\\Lecture1_23\images_noise\image4_01.jpg'
    obr = im2double(obr);

%%
%barevne slozky

    r = obr(:,:,1);
    g = obr(:,:,2);
    b = obr(:,:,3);

%%
%odhad sumu v barevnych slozkach
    sR = estimate_noise(r)*10;
    sG = estimate_noise(g)*10;
    sB = estimate_noise(b)*10;
%%
    rR = imnlmfilt(r,'ComparisonWindowSize',5,'DegreeOfSmoothing',sR);
    rG = imnlmfilt(g,'ComparisonWindowSize',5,'DegreeOfSmoothing',sG);
    rB = imnlmfilt(b,'ComparisonWindowSize',5,'DegreeOfSmoothing',sB);

    restored = zeros(size(obr,1),size(obr,2),3);
    restored(:,:,1) = rR;
    restored(:,:,2) = rG;
    restored(:,:,3) = rB;
%%
    if j<10
        nazev_out = ['filtered\image' int2str(i) '_' '0' int2str(j) '.jpg'];
    else
        nazev_out = ['filtered\image' int2str(i) '_' int2str(j) '.jpg'];
    end
    imwrite(restored,nazev_out)
%figure
%imshow(gray-restored)
    end
end