function result = rec_rgb(im)
    result = uint8(zeros(size(im,1), size(im,2), size(im,3)));
    R = im(:,:,1);
    G = im(:,:,2);
    B = im(:,:,3);

    inv_avg_R = 1/(mean(mean(R)));
    inv_avg_G = 1/(mean(mean(G)));
    inv_avg_B = 1/(mean(mean(B)));

    inv_max_RGB = max(max(inv_avg_R, inv_avg_G), inv_avg_B);
    inv_avg_R = inv_avg_R/inv_max_RGB;
    inv_avg_G = inv_avg_G/inv_max_RGB;
    inv_avg_B = inv_avg_B/inv_max_RGB;

     result(:,:,1) = R*inv_avg_R;
     result(:,:,2) = G*inv_avg_G;
     result(:,:,3) = B*inv_avg_B;
end