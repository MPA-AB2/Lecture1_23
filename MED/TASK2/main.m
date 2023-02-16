%im = imread("Lecture1_second_data\images_noise\image1_01.jpg");

%im_filt = imdiffusefilt(im, 'NumberOfIterations', 20);

path_to_noised_images = "Lecture1_second_data\images_noise";

myFiles = dir(fullfile(path_to_noised_images,'*.jpg')); %gets all wav files in struct

%for k = 1:length(myFiles)
for k = 1:11
  baseFileName = myFiles(k).name;
  fullFileName = fullfile(myFiles(k).folder, baseFileName);
  fprintf(1, 'Now reading %s\n', fullFileName);
  im = imread(fullFileName);
  filtered_im = zeros(size(im));
  w = [0.299, 0.587,0.114];
  R = im(:,:,1);
  G = im(:,:,2);
  B = im(:,:,3);
  %filtered_im = []
  for chan = [R G B]
      channel_gauss = imgaussfilt(chan, 2)
  end
  for chan = 1:3
    channel = im(:,:,chan);
%     channel_gauss = channel;
    channel_aniso_filt = imdiffusefilt(channel, 'NumberOfIterations', 4);
    %channel_medfilt = medfilt2(channel_aniso_filt);
    %filtered_im(:,:,chan) = channel_aniso_filt * w(chan);
    filtered_im(:,:,chan)= channel_aniso_filt;
  end
   filtered_im = cat(3, filtered_im(:,:,1), filtered_im(:,:,2), filtered_im(3));
  imwrite(filtered_im, strcat("images_denoised\", baseFileName))
  % all of your actions for filtering and plotting go here
end
disp('Images filtered')
%noise_eval('V:\AB2\MAIN\Lecture1_23\MED\TASK2\images_denoised\')