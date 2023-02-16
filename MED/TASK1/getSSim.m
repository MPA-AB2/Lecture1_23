function ssimval = getSSim(orig, noisy)
[ssimval,ssimmap] = ssim(noisy,orig);
%imshow(ssimmap,[])
%title("Local SSIM Map with Global SSIM Value: "+num2str(ssimval))
end