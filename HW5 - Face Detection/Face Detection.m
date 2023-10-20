pic = imread('picture.jpg');

hsv_pic = rgb2hsv(pic);

h_Ch_pic = hsv_pic(:, :, 1);

r_pic_msk = (h_Ch_pic >= 0 & h_Ch_pic <= 0.05) | (h_Ch_pic >= 0.9 & h_Ch_pic <= 1);

strl_pic = strel('disk',6);
r_pic_msk = imclose(r_pic_msk, strl_pic);
r_pic_msk = imopen(r_pic_msk, strl_pic);

sgmnt_pic = bsxfun(@times, pic, cast(r_pic_msk, 'like', pic));
figure, imshow(sgmnt_pic);