%��������ҵ��1��
%�Ѹ���ͼ���ֱ��ͼ����
str='woman2.bmp';
[img,map]=imread(str);
if ~isempty(map)
    img=ind2gray(img,map);
end
%����ֱ��ͼ
imhist(img);
