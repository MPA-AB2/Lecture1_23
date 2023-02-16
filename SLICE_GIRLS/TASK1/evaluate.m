function evaluate(imNoise, imOrig)

    imPSNR = psnr(imNoise,imOrig);
    imSSIM = ssim(imNoise,imOrig);
    imPIQE = piqe(imNoise);
    
    disp(['PSNR: ', num2str(imPSNR)])
    disp(['SSIM: ', num2str(imSSIM)])
    disp(['PIQE: ', num2str(imPIQE)])
    disp(' ')
end