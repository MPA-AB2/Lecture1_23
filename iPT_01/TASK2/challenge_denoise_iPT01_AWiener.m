for ii = 1:11
    FN = strcat('V:\AB2\2\orig\image1_',num2str(ii.','%02d'), '.jpg');
    prvni{ii} = imread(FN);
end
for ii = 1:11
    FN = strcat('V:\AB2\2\image2_',num2str(ii.','%02d'), '.jpg');
    druhe{ii} = imread(FN);
end
for ii = 1:11
    FN = strcat('V:\AB2\2\image3_',num2str(ii.','%02d'), '.jpg');
    treti{ii} = imread(FN);
end
for ii = 1:11
    FN = strcat('V:\AB2\2\image4_',num2str(ii.','%02d'), '.jpg');
    ctvrte{ii} = imread(FN);
end
for ii = 1:11
    FN = strcat('V:\AB2\2\image5_',num2str(ii.','%02d'), '.jpg');
    pate{ii} = imread(FN);
end
%% wiener
for i = 1:11
    im_prvni{1,i}(:,:,1) = wiener2((prvni{1,i}(:,:,1)),[12,12]);
    im_prvni{1,i}(:,:,2) = wiener2((prvni{1,i}(:,:,2)),[12,12]);
    im_prvni{1,i}(:,:,3) = wiener2((prvni{1,i}(:,:,3)),[12,12]);

    im_druhy{1,i}(:,:,1) = wiener2((druhe{1,i}(:,:,1)),[12,12]);
    im_druhy{1,i}(:,:,2) = wiener2((druhe{1,i}(:,:,2)),[12,12]);
    im_druhy{1,i}(:,:,3) = wiener2((druhe{1,i}(:,:,3)),[12,12]);

    im_treti{1,i}(:,:,1) = wiener2((treti{1,i}(:,:,1)),[12,12]);
    im_treti{1,i}(:,:,2) = wiener2((treti{1,i}(:,:,2)),[12,12]);
    im_treti{1,i}(:,:,3) = wiener2((treti{1,i}(:,:,3)),[12,12]);

    im_ctyry{1,i}(:,:,1) = wiener2((ctvrte{1,i}(:,:,1)),[12,12]);
    im_ctyry{1,i}(:,:,2) = wiener2((ctvrte{1,i}(:,:,2)),[12,12]);
    im_ctyry{1,i}(:,:,3) = wiener2((ctvrte{1,i}(:,:,3)),[12,12]);

    im_pet{1,i}(:,:,1) = wiener2((pate{1,i}(:,:,1)),[12,12]);
    im_pet{1,i}(:,:,2) = wiener2((pate{1,i}(:,:,2)),[12,12]);
    im_pet{1,i}(:,:,3) = wiener2((pate{1,i}(:,:,3)),[12,12]);
end

%%
for ii = 1:11
    FN = strcat('image1_',num2str(ii.','%02d'), '.jpg');
    imwrite(im_prvni{1,ii},FN)
end
for ii = 1:11
    FN = strcat('image2_',num2str(ii.','%02d'), '.jpg');
    imwrite(im_druhy{1,ii},FN)
end
for ii = 1:11
    FN = strcat('image3_',num2str(ii.','%02d'), '.jpg');
    imwrite(im_treti{1,ii},FN)
end
for ii = 1:11
    FN = strcat('image4_',num2str(ii.','%02d'), '.jpg');
    imwrite(im_ctyry{1,ii},FN)
end
for ii = 1:11
    FN = strcat('image5_',num2str(ii.','%02d'), '.jpg');
    imwrite(im_pet{1,ii},FN)
end
