clear;
clc;
sourcePic=imread('liulian.jpeg');%图像读入

grayPic=rgb2gray(mat2gray(sourcePic));%实现图像的矩阵归一化操作

%grayPic=imnoise(grayPic,'gaussian');

grayPic=wiener2(grayPic,[5 5]);

[m,n]=size(grayPic);

newGrayPic=grayPic;

LaplacianNum=0;%经Laplacian操作得到的每个像素的值

LaplacianThreshold=0.3;%设定阈值 0.1-0.2-0.3

for j=2:m-1 %进行边界提取

    for k=2:n-1

        LaplacianNum=abs(4*grayPic(j,k)-grayPic(j-1,k)-grayPic(j+1,k)-grayPic(j,k+1)-grayPic(j,k-1));

        if(LaplacianNum > LaplacianThreshold)

            newGrayPic(j,k)=255;

        else

            newGrayPic(j,k)=0;

        end

    end

end
subplot(1,3,1), imshow(grayPic);
title('Orginal Picture')

subplot(1,3,2), imshow(newGrayPic);
title('自编成的Laplacian算子的处理结果')

img=rgb2gray(sourcePic);
matlabGrayPic = edge(grayPic,'log');
subplot(1,3,3), imshow(matlabGrayPic);
title('matlab的Laplacian算子的处理结果')

