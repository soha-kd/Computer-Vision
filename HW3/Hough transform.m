function S1(inputImage)

     img = imread(inputImage);
     figure('Name', 'original','NumberTitle','off');
     imshow(img);
     rg2gr = rgb2gray(img);
     edges = edge(rg2gr,'canny');
     figure('Name', 'black & white edeges','NumberTitle','off');
     imshow(edges);
     [epicenters , radiuses] = imfindcircles(rg2gr,[6,33]);
     figure('Name', 'founded circles','NumberTitle','off');
     imshow(img);
     hold on;
     viscircles(epicenters,radiuses,'Color','g');
     %-------------------------------------------------------------
     %[c, r] = imfindcircles(rg2gr,[1,5],"Sensitivity",0.9,"EdgeThreshold",0.1);
     %figure('Name', 'founded holes','NumberTitle','off');
     %imshow(img);
     %hold on;
     %viscircles(c,r,'Color','r');
     %-------------------------------------------------------------
     disp('radiuses => ');
     disp(radiuses);
     a = pi*(radiuses.^2);
     disp('areas => '); 
     disp(a);
     
     
    