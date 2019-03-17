function imgo = HistoM(imgi,histos)
    %直方图匹配
    %输入：图像、直方图模板
    %输出：图像
    h=size(imgi,1);%输入图像的高
    w=size(imgi,2);%输入图像的宽
    histoi=HistoG(imgi);%输入图像的直方图
    %输入图像的分布函数
    cdfs=zeros(256,1);
    temp=0;
    for i=1:256
        temp=temp+255*histos(i);
        cdfs(i)=temp;
    end
    
    %求变换映射
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
    
    %根据求得的映射进行直方图匹配
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