input1=imread('camera_256.jpg');
hidden=imresize(input1,[1000, 1000]);
input2=imread('Logo_NIT_Binary.png');
pic=imresize(input2,[1000, 1000]);
pic=double(pic);
r=double(hidden-mod(hidden,2));
l=uint8(r+pic); 
figure
imshow(l)
title('watermarked'); 

MSE_s = immse(l, hidden);
fprintf('\n MSE is %0.4f  \n', MSE_s);

PSNR_s = psnr(l, hidden);
fprintf('\n PSNR value is %0.4f  \n', PSNR_s);

%detection of hidden image
h=mod(l,2);
p=zeros(1000,1000);

for input2=1:1000
    for pic=1:1000
        if(h(input2,pic)==1)
            p(input2,pic)=255;
        end
    end
end
s=imbinarize(p);
figure
imshow(s); 
title('hidden image')