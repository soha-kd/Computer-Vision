function [b_sk_map] = rec_skin(f_name)
    in_img = imread(f_name);
    h_img = size(in_img,1);
    w_img = size(in_img,2);
    b_sk_map = zeros(h_img,w_img);
    RGB_image = rec_rgb(in_img);    
    image_ycbcr = rgb2ycbcr(RGB_image);
    Cb = image_ycbcr(:,:,2);
    Cr = image_ycbcr(:,:,3);
    [r,c,~] = find(Cb>=77 & Cb<=127 & Cr>=133 & Cr<=173);
    i = size(r,1);
    for i=1:i
        b_sk_map(r(i),c(i)) = 1;
    end
    imshow(in_img);
    figure; imshow(b_sk_map);
end