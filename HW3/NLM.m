function S2(inputImage)

img = imread(inputImage);
figure('Name', 'original picture','NumberTitle','off'); 
imshow(img) ;    
r2g = rgb2gray(img);
figure('Name', 'binary picture','NumberTitle','off');  
imshow(r2g) ; 
noisedPic = imnoise(r2g,"gaussian",0,0.25);
figure('Name', 'gaussian noised picture (mean=0  , var=0.25)','NumberTitle','off'); 
imshow(noisedPic) ;
tic
% ----------------------------------mean-----------------------------------
meanFilter = fspecial('average');
mPic = filter2(meanFilter,noisedPic);
figure('Name', '3*3 mean filter','NumberTitle','off'); 
imshow(mPic/255);
img2unit8 = im2uint8(mPic);
% ---------------------------mean filter Criteria--------------------------
mseMfCriteria = immse(img2unit8, r2g);
fprintf('MSE for mean filter 3*3 ==> %0.4f \n', mseMfCriteria);
PsnrMFCriteria = psnr(img2unit8, r2g);
fprintf('PSNR for mean filter 3*3 ==> %0.4f \n', PsnrMFCriteria);
toc
fprintf('\n');
fprintf('\n');
tic
% ----------------------------------NLM------------------------------------
[NlmPic,estDegree] = imnlmfilt(noisedPic);
esti = num2str(estDegree);
figure('Name', ['NLM, Smoothing Degree stimation is => ' , esti] ,'NumberTitle','off'); 
imshow(NlmPic) ; 
% --------------------------NLM filter Criteria----------------------------
mseMfCriteria = immse(NlmPic, r2g);
fprintf('\n');
fprintf('MSE for NLM ==> %0.4f \n', mseMfCriteria);
PsnrMFCriteria = psnr(NlmPic, r2g);
fprintf('PSNR for NLM ==> %0.4f \n', PsnrMFCriteria);
toc