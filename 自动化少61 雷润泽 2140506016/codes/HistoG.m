function histo = HistoG(img)
    %��ȡֱ��ͼ
    %���� ͼ�� 0-255
    %��� ֱ��ͼ����
    h=size(img,1);%����ͼ��ĸ�
    w=size(img,2);%����ͼ��Ŀ�
    %��ȡֱ��ͼ
    histo=zeros(256,1);
    for i=1:h
        for j=1:w
            temp=round(img(i,j));
            if(temp<0)
                temp=0;
            end
            if(temp>255)
                temp=255;
            end
            histo(temp+1)=histo(temp+1)+1;
        end
    end
    histo=histo./(h*w);
end
