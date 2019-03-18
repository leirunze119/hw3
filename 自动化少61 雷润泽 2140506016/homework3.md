#数字图像与视频处理

##第三次作业报告

----

姓名：雷润泽

班级：自动化少61

学号：2140506016

----

**摘要：** 本次作业完成的主要内容为使用matlab实现对图像的直方图处理，包括绘制图像直方图、对图像进行直方图均衡、直方图匹配、局部直方图增强以及基于直方图的图像分割。

###1.画出图像的直方图

**思路分析：** 编写函数`HistoG`，其作用为生成一个256×1的矩阵，矩阵的每一个元素对应输入图像中某一灰度级的像素点的个数。实现方法为对图像的每一个元素进行遍历，并对每一个像素点的值进行分类统计(函数代码参见`/codes/HistoG.txt`)。为了便于绘图，第一题所得的结果直接使用matlab函数`imhist`，而自行编写的函数`HistoG`会在之后的几题中用到。

**代码实现：** 参见`/codes/h3_1.txt`

**处理结果：**

citywall.bmp的直方图

![citywall.bmp的直方图](paperpics/citywall_histogram.bmp "citywall_histogram.bmp")

citywall1.bmp的直方图

![citywall1.bmp的直方图](paperpics/citywall1_histogram.bmp "citywall1_histogram.bmp")

citywall2.bmp的直方图

![citywall2.bmp的直方图](paperpics/citywall2_histogram.bmp "citywall2_histogram.bmp")

elain.bmp的直方图

![elain.bmp的直方图](paperpics/elain_histogram.bmp "elain_histogram.bmp")

elain1.bmp的直方图

![elain1.bmp的直方图](paperpics/elain1_histogram.bmp "elain1_histogram.bmp")

elain2.bmp的直方图

![elain2.bmp的直方图](paperpics/elain2_histogram.bmp "elain2_histogram.bmp")

elain3.bmp的直方图

![elain3.bmp的直方图](paperpics/elain3_histogram.bmp "elain3_histogram.bmp")

lena.bmp的直方图

![lena.bmp的直方图](paperpics/lena_histogram.bmp "lena_histogram.bmp")

lena1.bmp的直方图

![lena1.bmp的直方图](paperpics/lena1_histogram.bmp "lena1_histogram.bmp")

lena2.bmp的直方图

![lena2.bmp的直方图](paperpics/lena2_histogram.bmp "lena2_histogram.bmp")

lena4.bmp的直方图

![lena4.bmp的直方图](paperpics/lena4_histogram.bmp "lena4_histogram.bmp")

woman.bmp的直方图

![woman.bmp的直方图](paperpics/woman_histogram.bmp "woman_histogram.bmp")

woman1.bmp的直方图

![woman1.bmp的直方图](paperpics/woman1_histogram.bmp "woman1_histogram.bmp")

woman2.bmp的直方图

![woman2.bmp的直方图](paperpics/woman2_histogram.bmp "woman2_histogram.bmp")

###2.直方图均衡

**思路分析：** 编写函数`HistoE`，其作用为实现对图像的直方图均衡操作。实现方法为先求取图像的直方图，然后由直方图计算像素值的分布函数，进而求得原图像素值和均衡后的像素值之间的变换映射，然后使用求得的变换映射对原图像进行处理，得到所求的直方图均衡后的图像。(函数代码参见`/codes/HistoE.txt`)。

**代码实现：** 参见`/codes/h3_2.txt`

**处理结果：**

citywall.bmp的处理结果

![citywall.bmp的处理结果](paperpics/citywall_heresult.bmp "citywall_heresult.bmp")

citywall1.bmp的处理结果

![citywall1.bmp的处理结果](paperpics/citywall1_heresult.bmp "citywall1_heresult.bmp")

citywall2.bmp的处理结果

![citywall2.bmp的处理结果](paperpics/citywall2_heresult.bmp "citywall2_heresult.bmp")

elain.bmp的处理结果

![elain.bmp的处理结果](paperpics/elain_heresult.bmp "elain_heresult.bmp")

elain1.bmp的处理结果

![elain1.bmp的处理结果](paperpics/elain1_heresult.bmp "elain1_heresult.bmp")

elain2.bmp的处理结果

![elain2.bmp的处理结果](paperpics/elain2_heresult.bmp "elain2_heresult.bmp")

elain3.bmp的处理结果

![elain3.bmp的处理结果](paperpics/elain3_heresult.bmp "elain3_heresult.bmp")

观察实验结果可以发现，直方图均衡可以实现图像的自适应对比度增强，且均衡后的图像和原图像相比往往有较大的灰度范围。此外，比较同组的寄付图像的处理结果可知，若原图像出现某个灰度值上的像素频率远大于其他灰度值处时，直方图均衡的处理效果不太理想。

###3.直方图匹配

**思路分析：** 编写函数`HistoM`，其作用为实现对图像的直方图匹配操作。实现方法为先求取图像的直方图，并直方图计算像素值的分布函数，然后求取给定直方图所对应的分布函数，利用两个分布函数求得原图像素值和直方图匹配后的像素值之间的变换映射，最后使用求得的变换映射对原图像进行处理，得到所求的直方图均衡后的图像。(函数代码参见`/codes/HistoG.txt`)。考虑到在问题2中观察到当某个灰度值上的像素频率远大于其他灰度值处时，直方图均衡的处理效果不太理想，例如citywall1.bmp在直方图均衡后，其亮部（灰度值为255处）聚集了大量的像素点，由于直方图均衡实现的是灰度值的近似平均分配，导致其他像素点处理后的灰度值明显偏向于暗部，为了使其大多数像素点的灰度值可以实现较为均匀的分布，在直方图匹配中也选取在灰度为255处存在一个较大的峰值，其他区域上频率平均的直方图模板，其他图像的匹配模板选取同理。

**代码实现：** 参见`/codes/h3_3.txt`

**处理结果：**

citywall.bmp的处理结果

![citywall.bmp的处理结果](paperpics/citywall_hmresult.bmp "citywall_hmresult.bmp")

citywall1.bmp的处理结果

![citywall1.bmp的处理结果](paperpics/citywall1_hmresult.bmp "citywall1_hmresult.bmp")

citywall2.bmp的处理结果

![citywall2.bmp的处理结果](paperpics/citywall2_hmresult.bmp "citywall2_hmresult.bmp")

elain.bmp的处理结果

![elain.bmp的处理结果](paperpics/elain_hmresult.bmp "elain_hmresult.bmp")

elain1.bmp的处理结果

![elain1.bmp的处理结果](paperpics/elain1_hmresult.bmp "elain1_hmresult.bmp")

elain2.bmp的处理结果

![elain2.bmp的处理结果](paperpics/elain2_hmresult.bmp "elain2_hmresult.bmp")

elain3.bmp的处理结果

![elain3.bmp的处理结果](paperpics/elain3_hmresult.bmp "elain3_hmresult.bmp")

lena.bmp的处理结果

![lena.bmp的处理结果](paperpics/lena_hmresult.bmp "lena_hmresult.bmp")

lena1.bmp的处理结果

![lena1.bmp的处理结果](paperpics/lena1_hmresult.bmp "lena1_hmresult.bmp")

lena2.bmp的处理结果

![lena2.bmp的处理结果](paperpics/lena2_hmresult.bmp "lena2_hmresult.bmp")

lena4.bmp的处理结果

![lena4.bmp的处理结果](paperpics/lena4_hmresult.bmp "lena4_hmresult.bmp")

woman.bmp的处理结果

![woman.bmp的处理结果](paperpics/woman_hmresult.bmp "woman_hmresult.bmp")

woman1.bmp的处理结果

![woman1.bmp的处理结果](paperpics/woman1_hmresult.bmp "woman1_hmresult.bmp")

woman2.bmp的处理结果

![woman2.bmp的处理结果](paperpics/woman2_hmresult.bmp "woman2_hmresult.bmp")

比较直方图匹配与直方图均衡后的结果可知，适当选取匹配直方图可以使得图像得到更好的处理效果，进一步提高图像对比度。

###4.局部直方图增强

**思路分析：** 局部直方图增强的原理是，先得到图像的整体的直方图并求取其平均值`mg`和标准差`σg`，再在图像的每个区域中计算直方图的平均值`ml`和标准差`σl`。再由给定的参数`k0`,`k1`,`k2`作为阈值的选取标准，即`ml≤k0·mg且k1·σg≤σl≤k2·σg`。对于满足该条件的区域中心点，对其灰度值做`E`倍的增强，得到的结果即为所求局部直方图增强处理后的图像。可以由数学上证明，对直方图求取均值和标准差与直接对图像进行该操作的效果是一致的，因此在程序中对图像的值进行计算处理。

**代码实现：** 参见`/codes/h3_4.txt`

**处理结果：**

elain.bmp的处理结果

![elain.bmp的处理结果](paperpics/elain_lhsresult.bmp "elain_lhsresult.bmp")

lena.bmp的处理结果

![lena.bmp的处理结果](paperpics/lena_lhsresult.bmp "lena_lhsresult.bmp")

比较处理前后的图像可知，可以通过选取适当的阈值参数，通过局部直方图增强的方式处理图像，对图像的局部进行增强。

###5.利用直方图分割图像

**思路分析：** 图像分割即为图像的二值化处理，利用直方图可以帮助我们选取合适的分割阈值。本程序使用的阈值选取方法为基于谷底最小值的阈值，即找出图像的直方图中的两个最大频率峰值，然后找到直方图两个峰值之间的频率最小值，并以此处的灰度值作为阈值对图像进行分割处理。

**代码实现：** 参见`/codes/h3_5.txt`

**处理结果：**

elain.bmp的处理结果

![elain.bmp的处理结果](images/elain_div.bmp "elain_div.bmp")

woman.bmp的处理结果

![woman.bmp的处理结果](images/woman_div.bmp "woman_div.bmp")

##附录

###程序代码

参见目录`/codes`下的文件，其中文件`h3_*.txt`为作业对应题目的matlab脚本代码，其他文件为使用到的自行编写的matlab函数文件。

###处理结果

处理后的图像参见目录`/images`下的文件，其中后缀为`_he`的文件为直方图均衡的处理结果，后缀为`_hm`的文件为直方图匹配的处理结果，后缀为`_lhs`的文件为局部直方图增强的处理结果，后缀为`_div`的文件为直方图图像分割的处理结果。

报告中使用的图片参见目录`/paperpics`下的文件。
