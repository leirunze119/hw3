function imgo = HistoE(imgi)
    %ֱ��ͼ����
    %���� ͼ��
    %��� ͼ��
    G=zeros(256,1);
    h=size(imgi,1);%����ͼ��ĸ�
    w=size(imgi,2);%����ͼ��Ŀ�
    histo=HistoG(imgi);%����ͼ���ֱ��ͼ
    
    %��ȡֱ��ͼ����ı任ӳ��
    s=0;
    for i=1:256
        s=s+255*histo(i);
        temp=round(s);
        if(temp<0)
            temp=0;
        end
        if(temp>255)
            temp=255;
        end
        G(i)=temp;
    end
    %���ݱ任ӳ�����ֱ��ͼ������ͼ��
    imgo=zeros(h,w);
    for i=1:h
        for j=1:w
            temp=round(imgi(i,j));
            if(temp<0)
                temp=0;
            end
            if(temp>255)
                temp=255;
            end
            imgo(i,j)=G(temp+1);
        end
    end
end

