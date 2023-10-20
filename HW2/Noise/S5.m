function[im] = S5(im)
    img = imread(im);
    f1 = imnoise(img,"gaussian",0,0.02);
    figure
    imshow(f1) , title("m=0  , v=0.02");
    f2 = imnoise(img,"gaussian",0,0.15);
    figure
    imshow(f2) , title("m=0  , v=0.15");
    f3 = imnoise(img,"gaussian",0,0.5);
    figure
    imshow(f3) , title("m=0  , v=0.5");
    f4 = imnoise(img,"gaussian",0,2);
    figure
    imshow(f4) , title("m=0  , v=2");