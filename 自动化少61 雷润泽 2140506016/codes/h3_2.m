%��������ҵ��2��
%������ͼ�����ֱ��ͼ���⣻���������ͼ���Դͼ����бȶ�
str='woman2.bmp';
stro='woman2_he.bmp';

[img,map]=imread(str);
if ~isempty(map)
    img=ind2gray(img,map);
end
img=im2double(img).*255;

%ֱ��ͼ����
imghe=HistoE(img);

imwrite(imghe./255,stro);

subplot(2,2,1);
imshow(img./255);
title('ԭͼ��');
subplot(2,2,2);
imhist(img./255);
title('ԭͼ���ֱ��ͼ');
subplot(2,2,3);
imshow(imghe./255);
title('ֱ��ͼ������ͼ��');
subplot(2,2,4);
imhist(imghe./255);
title('ֱ��ͼ������ͼ���ֱ��ͼ');
