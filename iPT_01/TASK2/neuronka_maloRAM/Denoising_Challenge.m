%% loading data


% for ii = 1:11
%     FN = strcat('V:\AB2\Lecture1_23\iPT_01\TASK2\Lecture1_second_data\images_noise\image1_',num2str(ii.','%02d'), '.jpg');
%     D{ii} = imread(FN);
% end
%
% for ii = 1:11
%     FN = strcat('V:\AB2\Lecture1_23\iPT_01\TASK2\Lecture1_second_data\images_noise\image2_',num2str(ii.','%02d'), '.jpg');
%     D{ii+11} = imread(FN);
% end
% 
% for ii = 1:11
%     FN = strcat('V:\AB2\Lecture1_23\iPT_01\TASK2\Lecture1_second_data\images_noise\image3_',num2str(ii.','%02d'), '.jpg');
%     D{ii+(11*2)} = imread(FN);
% end
% 
% for ii = 1:11
%     FN = strcat('V:\AB2\Lecture1_23\iPT_01\TASK2\Lecture1_second_data\images_noise\image4_',num2str(ii.','%02d'), '.jpg');
%     D{ii+11*3} = imread(FN);
% end
% 
% for ii = 1:11
%     FN = strcat('V:\AB2\Lecture1_23\iPT_01\TASK2\Lecture1_second_data\images_noise\image5_',num2str(ii.','%02d'), '.jpg');
%     D{ii+11*4} = imread(FN);
% end





%% Net denoising
ii=1;
FN = strcat('V:\AB2\Lecture1_23\iPT_01\TASK2\Lecture1_second_data\images_noise\image1_',num2str(ii.','%02d'), '.jpg');
D{ii} = imread(FN);

net = denoisingNetwork('DnCNN');

% for ii = 1:55
% 
%     actual_im=D{1,ii};
% 
%     for rgb_i = 1:3
%     
%      actual_im_denoise(:,:,rgb_i)= denoiseImage(actual_im(:,:,rgb_i),net);
%      
% 
% 
%     end
%     D_denois{1,ii}=actual_im_denoise;
% end

actual_im=D{1,1};
actual_im_denoise=actual_im;    
     for rgb_i = 1:3
        actual_im_g=actual_im(:,:,rgb_i);

     actual_im_denoise(:,:,rgb_i)= denoiseImage(actual_im_g,net);

     end
     

imshow(actual_im)


