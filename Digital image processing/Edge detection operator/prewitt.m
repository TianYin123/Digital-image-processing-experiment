clear all;
clc;
sourcePic=(imread('liulian.jpeg'));

grayPic=rgb2gray(mat2gray(sourcePic));%实现图像的矩阵归一化操作

%grayPic=mat2gray(sourcePic);

%grayPic=rgb2gray(sourcePic);
[m,n]=size(grayPic);

newGrayPic=grayPic;

PrewittNum=0;

PrewittThreshold=0.6;%设定阈值 0.2-0.5-0.8

for j=2:m-1 %进行边界提取

    for k=2:n-1

        PrewittNum=abs(grayPic(j-1,k+1)-grayPic(j+1,k+1)+grayPic(j-1,k)-grayPic(j+1,k)+grayPic(j-1,k-1)-grayPic(j+1,k-1))+abs(grayPic(j-1,k+1)+grayPic(j,k+1)+grayPic(j+1,k+1)-grayPic(j-1,k-1)-grayPic(j,k-1)-grayPic(j+1,k-1));

        if(PrewittNum > PrewittThreshold)

            newGrayPic(j,k)=255;

        else

            newGrayPic(j,k)=0;

        end

    end

end
subplot(1,3,1), imshow(grayPic);
title('Orginal Picture')

subplot(1,3,2), imshow(newGrayPic);
title('自制的Prewitt算子的处理结果')

img=rgb2gray(sourcePic);
matlabGrayPic = edge(img,'Prewitt');
subplot(1,3,3), imshow(matlabGrayPic);
title('matlab的Prewitt算子的处理结果')