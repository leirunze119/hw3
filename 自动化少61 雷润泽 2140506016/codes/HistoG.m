function histo = HistoG(img)
    %获取直方图
    %输入 图像 0-255
    %输出 直方图数据
    h=size(img,1);%输入图像的高
    w=size(img,2);%输入图像的宽
    %求取直方图
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
