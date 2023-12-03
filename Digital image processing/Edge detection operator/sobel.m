clear;

sourcePic=imread('liulian.jpeg');

%grayPic=mat2gray(sourcePic);

grayPic=rgb2gray(mat2gray(sourcePic));%实现图像的矩阵归一化操作

[m,n]=size(grayPic);

newGrayPic=grayPic;

sobelNum=0;

sobelThreshold=0.9;%0.5-0.7-0.8

for j=2:m-1

    for k=2:n-1

        sobelNum=abs(grayPic(j-1,k+1)+2*grayPic(j,k+1)+grayPic(j+1,k+1)-grayPic(j-1,k-1)-2*grayPic(j,k-1)-grayPic(j+1,k-1))+abs(grayPic(j-1,k-1)+2*grayPic(j-1,k)+grayPic(j-1,k+1)-grayPic(j+1,k-1)-2*grayPic(j+1,k)-grayPic(j+1,k+1));

        if(sobelNum > sobelThreshold)

            newGrayPic(j,k)=255;

        else

            newGrayPic(j,k)=0;

        end

    end

end
subplot(1,3,1), imshow(grayPic);
title('Orginal Picture')

subplot(1,3,2), imshow(newGrayPic);
title('自制的Sobel算子的处理结果')

img=rgb2gray(sourcePic);
matlabGrayPic = edge(img,'Sobel');
subplot(1,3,3), imshow(matlabGrayPic);
title('matlab的Sobel算子的处理结果')