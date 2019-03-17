%第三次作业第4题
%对elain和lena图像进行7*7的局部直方图增强
str='lena.bmp';
stro='lena_lhs.bmp';

%参数
%elain
% k0=1.2;
% k1=0.02;
% k2=1.5;
% E=0.8;
%lena
k0=0.4;
k1=0.02;
k2=0.6;
E=2;

[img,map]=imread(str);
if ~isempty(map)
    img=ind2gray(img,map);
end
img=im2double(img).*255;
mg=mean2(img);%全局均值
sdg=std2(img);%全局标准差

imgex=expand(img,7);%扩展图像
imglhs=img;
for i=1:size(img,1)
    for j=1:size(img,2)
        ml=mean2(imgex(i:i+6,j:j+6));%局部均值
        sdl=std2(imgex(i:i+6,j:j+6));%局部标准差
        if(ml<k0*mg&&sdl>k1*sdg&&sdl<k2*sdg)
            imglhs(i,j)=E*img(i,j);
        end
    end
end

imwrite(imglhs./255,stro);

subplot(2,2,1);
imshow(img./255);
title('原图像');
subplot(2,2,2);
imhist(img./255);
title('原图像的直方图');
subplot(2,2,3);
imshow(imglhs./255);
title('局部直方图增强后的图像');
subplot(2,2,4);
imhist(imglhs./255);
title('局部直方图增强后的图像的直方图');