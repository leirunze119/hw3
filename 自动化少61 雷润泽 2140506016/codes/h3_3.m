%��������ҵ��3��
%��һ����ͼ���ն�Դͼ��ֱ��ͼ�Ĺ۲죬��������ָ����ͬԴͼ���ֱ��ͼ������ֱ��ͼƥ�䣬����ͼ����ǿ
str='lena4.bmp';
stro='lena4_hm.bmp';
%ѡȡ��ģ��
mm='d';
%n-ͨ��ͼƬ������ֱ��ͼ��ֵ�ϴ�ͽ�С����Ƶ�ʶ�С��
%d-����ͼƬ������ֱ��ͼ��ֵ��С����Ƶ�ʴ�
%l-����ͼƬ������ֱ��ͼ��ֵ�ϴ󴦵�Ƶ�ʴ�
%ld-%�ȹ����ֹ�����ͼƬ������ֱ��ͼ��ֵ�ϴ�ͽ�С����Ƶ�ʶ���
th=28;%��ֵ

%ѡȡģ��
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
%ֱ��ͼƥ��
imghm=HistoM(img,match);

imwrite(imghm./255,stro);

subplot(2,3,1);
imshow(img./255);
title('ԭͼ��');
subplot(2,3,2);
imhist(img./255);
title('ԭͼ���ֱ��ͼ');
subplot(2,3,3);
stem(match);
title('ƥ��ֱ��ͼ');
subplot(2,3,4);
imshow(imghm./255);
title('ֱ��ͼƥ����ͼ��');
subplot(2,3,5);
imhist(imghm./255);
title('ֱ��ͼƥ����ͼ���ֱ��ͼ');
