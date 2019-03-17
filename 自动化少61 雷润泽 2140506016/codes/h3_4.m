%��������ҵ��4��
%��elain��lenaͼ�����7*7�ľֲ�ֱ��ͼ��ǿ
str='lena.bmp';
stro='lena_lhs.bmp';

%����
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
mg=mean2(img);%ȫ�־�ֵ
sdg=std2(img);%ȫ�ֱ�׼��

imgex=expand(img,7);%��չͼ��
imglhs=img;
for i=1:size(img,1)
    for j=1:size(img,2)
        ml=mean2(imgex(i:i+6,j:j+6));%�ֲ���ֵ
        sdl=std2(imgex(i:i+6,j:j+6));%�ֲ���׼��
        if(ml<k0*mg&&sdl>k1*sdg&&sdl<k2*sdg)
            imglhs(i,j)=E*img(i,j);
        end
    end
end

imwrite(imglhs./255,stro);

subplot(2,2,1);
imshow(img./255);
title('ԭͼ��');
subplot(2,2,2);
imhist(img./255);
title('ԭͼ���ֱ��ͼ');
subplot(2,2,3);
imshow(imglhs./255);
title('�ֲ�ֱ��ͼ��ǿ���ͼ��');
subplot(2,2,4);
imhist(imglhs./255);
title('�ֲ�ֱ��ͼ��ǿ���ͼ���ֱ��ͼ');