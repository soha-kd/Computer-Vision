function [im] = S2(im)

    img = imread(im);
    f1 = imresize(img,2.3,"nearest");
    f2 = imresize(img,0.3,"nearest");
    subplot(1,3,1), imshow(f1) , title("nn 2.3");
    subplot(1,3,2), imshow(img) , title("normal");
    subplot(1,3,3), imshow(f2) , title("nn 0.3");
    f3 = imresize(img,2.3,"bilinear");
    f4 = imresize(img,0.3,"bilinear");
    subplot(1,3,1), imshow(f3) , title("bilinear 2.3");
    subplot(1,3,2), imshow(img) , title("normal");
    subplot(1,3,3), imshow(f4) , title("bilinear 0.3");
    f5 = imresize(img,2.3,"bicubic");
    f6 = imresize(img,0.3,"bicubic");
    subplot(1,3,1), imshow(f5) , title("bicubic 2.3");
    subplot(1,3,2), imshow(img) , title("normal");
    subplot(1,3,3), imshow(f6) , title("bicubic 0.3");
    
    