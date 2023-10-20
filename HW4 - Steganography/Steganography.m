cMan_img = imread('camera_256.JPG');
logo_img = imread('Logo_NIT_Binary.png');

logo_img = imresize(logo_img, [size(cMan_img, 1) size(cMan_img, 2)]);
cMan_img = im2double(cMan_img);
logo_img = im2double(logo_img);

radi = 30;
cMan_img_lowPass = imgaussfilt(cMan_img, radi);
logo_img_lowPass = imgaussfilt(logo_img, radi);

cMan_img_highPass = cMan_img - cMan_img_lowPass;

host_image_fft = fft2(cMan_img);
logo_img_fft = fft2(logo_img_lowPass);

watermarked_img_fft = host_image_fft + logo_img_fft;
watermarkedCMan_img = real(ifft2(watermarked_img_fft));

extract_cMan_img_fft = watermarked_img_fft - logo_img_fft;
conv_extracte_cMan_img = real(ifft2(extract_cMan_img_fft));

extract_logo_img_fft = watermarked_img_fft - host_image_fft;
conv_extract_img = real(ifft2(extract_logo_img_fft));

figure;
subplot(1,5,1), imshow(cMan_img), title('Original camera man Image');
subplot(1,5,2),imshow(logo_img), title('resized logo Image');
subplot(1,5,3), imshow(watermarkedCMan_img), title('Watermarked Image');
subplot(1,5,4), imshow(conv_extract_img), title('Extracted logo');
subplot(1,5,5), imshow(conv_extracte_cMan_img), title('Extracted host image');

MSE_f = immse(watermarkedCMan_img, cMan_img);
fprintf('\n MSE is %0.4f  \n', MSE_f);

PSNR_F = psnr(watermarkedCMan_img, cMan_img);
fprintf('\n PSNR value is %0.4f  \n', PSNR_F);
