%第三次作业第2题
%把所有图像进行直方图均衡；输出均衡后的图像和源图像进行比对
str='woman2.bmp';
stro='woman2_he.bmp';

[img,map]=imread(str);
if ~isempty(map)
    img=ind2gray(img,map);
end
img=im2double(img).*255;

%直方图均衡
imghe=HistoE(img);

imwrite(imghe./255,stro);

subplot(2,2,1);
imshow(img./255);
title('原图像');
subplot(2,2,2);
imhist(img./255);
title('原图像的直方图');
subplot(2,2,3);
imshow(imghe./255);
title('直方图均衡后的图像');
subplot(2,2,4);
imhist(imghe./255);
title('直方图均衡后的图像的直方图');
