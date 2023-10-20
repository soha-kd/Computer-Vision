function S3(inputImage)

    img = imread(inputImage);
    r2g = rgb2gray(img);
    % ------------------------------Canny----------------------------------
    cannyEdging = edge(r2g,'canny',0.4,1.9);
    cannyEdginguUnit8 = im2uint8(cannyEdging);
    figure('Name', 'canny with threshold = 0.4 , sigma = 1.9','NumberTitle','off');   
    imshow(cannyEdging);
    % ------------------------------Sobel----------------------------------
    sobelEdging = edge(r2g,'sobel',0.4);
    sobelEdgingUnit8 = im2uint8(sobelEdging);
    figure('Name', 'sobel','NumberTitle','off');
    imshow(sobelEdging);
    % ------------------------------Roberts--------------------------------
    robertsEdging = edge(r2g,"roberts",0.4);
    robertsEdgingUnit8 = im2uint8(robertsEdging);
    figure('Name', 'roberts','NumberTitle','off');
    imshow(robertsEdging); 
    % -----------------------------Prewitt---------------------------------
    prewittEdging = edge(r2g,"prewitt",0.4);
    prewittEdgingUnit8 = im2uint8(prewittEdging);
    figure('Name', 'prewitt','NumberTitle','off');
    imshow(prewittEdging);

    % ----------------------------MSE and PSNR-----------------------------
    C_MSE = immse(cannyEdginguUnit8, r2g);
    fprintf('Canny MSE ==>  %0.4f \n', C_MSE);
    C_PSNR = psnr(cannyEdginguUnit8, r2g);
    fprintf('Canny PSNR ==> %0.4f \n', C_PSNR);
    fprintf('\n');
    S_MSE = immse(sobelEdgingUnit8, r2g);
    fprintf('Sobel MSE ==>  %0.4f \n', S_MSE);
    S_PSNR = psnr(sobelEdgingUnit8, r2g);
    fprintf('Sobel PSNR ==> %0.4f \n', S_PSNR);
    fprintf('\n');
    R_MSE = immse(robertsEdgingUnit8, r2g);
    fprintf('Roberts MSE ==>  %0.4f \n', R_MSE);
    R_PSNR = psnr(robertsEdgingUnit8, r2g);
    fprintf('Roberts PSNR ==> %0.4f \n', R_PSNR);
    fprintf('\n');
    P_MSE = immse(prewittEdgingUnit8, r2g);
    fprintf('Prewitt MSE ==> %0.4f \n', P_MSE);    
    P_PSNR = psnr(prewittEdgingUnit8, r2g);
    fprintf('Prewitt PSNR ==> %0.4f \n', P_PSNR);

