function imgo = HistoM(imgi,histos)
    %ֱ��ͼƥ��
    %���룺ͼ��ֱ��ͼģ��
    %�����ͼ��
    h=size(imgi,1);%����ͼ��ĸ�
    w=size(imgi,2);%����ͼ��Ŀ�
    histoi=HistoG(imgi);%����ͼ���ֱ��ͼ
    %����ͼ��ķֲ�����
    cdfs=zeros(256,1);
    temp=0;
    for i=1:256
        temp=temp+255*histos(i);
        cdfs(i)=temp;
    end
    
    %��任ӳ��
    G=zeros(256,1);
    temp=0;
    for i=1:256
        temp=temp+255*histoi(i);
        indexL=1;
        indexH=256;
        while(indexL<255&&cdfs(indexL)<temp)
            indexL=indexL+1;
        end
        while(indexH>1&&cdfs(indexH)>temp)
            indexH=indexH-1;
        end
        dL=abs(cdfs(indexL)-temp);
        dH=abs(cdfs(indexH)-temp);
        if(dL>dH)
            G(i)=indexH-1;
        else
            G(i)=indexL-1;
        end
    end
    
    %������õ�ӳ�����ֱ��ͼƥ��
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