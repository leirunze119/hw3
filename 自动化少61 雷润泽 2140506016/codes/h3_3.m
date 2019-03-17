%第三次作业第3题
%进一步把图像按照对源图像直方图的观察，各自自行指定不同源图像的直方图，进行直方图匹配，进行图像增强
str='lena4.bmp';
stro='lena4_hm.bmp';
%选取的模板
mm='d';
%n-通常图片（均衡直方图在值较大和较小处的频率都小）
%d-过暗图片（均衡直方图在值较小处的频率大）
%l-过亮图片（均衡直方图在值较大处的频率大）
%ld-%既过亮又过暗的图片（均衡直方图在值较大和较小处的频率都大）
th=28;%阈值

%选取模板
match=ones(256,1);
switch mm
    case 'd'
        match(1:5)=th;
    case 'l'
        match(252:256)=th;
    case 'ld'
        match(1:5)=th;
        match(252:256)=th;
end
match=normalize(match,'norm',1);

[img,map]=imread(str);
if ~isempty(map)
    img=ind2gray(img,map);
end
img=im2double(img).*255;
%直方图匹配
imghm=HistoM(img,match);

imwrite(imghm./255,stro);

subplot(2,3,1);
imshow(img./255);
title('原图像');
subplot(2,3,2);
imhist(img./255);
title('原图像的直方图');
subplot(2,3,3);
stem(match);
title('匹配直方图');
subplot(2,3,4);
imshow(imghm./255);
title('直方图匹配后的图像');
subplot(2,3,5);
imhist(imghm./255);
title('直方图匹配后的图像的直方图');
