%第三次作业第4题
%利用直方图对图像elain和woman进行分割

str='elain.bmp';
stro='elain_div.bmp';

[img,map]=imread(str);
if ~isempty(map)
    img=ind2gray(img,map);
end
img=im2double(img).*255;
h=HistoG(img);
%两个峰值
im1=1;
m1=h(1);
im2=2;
m2=h(2);
for i=3:256
    if(h(i)>m1||h(i)>m2)
        if(m1>m2)
            im2=i;
            m2=h(i);
        else
            im1=i;
            m1=h(i);
        end
    end
end
if(im1>im2)
    temp=im1;
    im1=im2;
    im2=temp;
end
%两峰之间的谷值
im3=im1;
m3=h(im1);
for i=im1+1:im2
    if(h(i)<=m3)
        im3=i;
        m3=h(i);
    end
end
th=im3;%阈值
%分割
imgdiv=img;
for i=1:size(img,1)
    for j=1:size(img,2)
        if(img(i,j)<=th)
            imgdiv(i,j)=0;
        else
            imgdiv(i,j)=255;
        end
    end
end

imwrite(imgdiv./255,stro);

subplot(2,2,1);
imshow(img./255);
title('原图像');
subplot(2,2,2);
imhist(img./255);
title('原图像的直方图');
subplot(2,2,3);
imshow(imgdiv./255);
title('分割后的图像');
subplot(2,2,4);
imhist(imgdiv./255);
title('分割后的图像的直方图');
