clear all;

clc;

sourcePic=imread('liulian.jpeg');

grayPic=rgb2gray(mat2gray(sourcePic));%实现图像的矩阵归一化操作

%grayPic=mat2gray(sourcePic);

[m,n]=size(grayPic);

newGrayPic=grayPic;

robertsNum=0;

robertThreshold=0.3; %0.1-0.2-0.3

for j=1:m-1

    for k=1:n-1

        robertsNum = abs(grayPic(j,k)-grayPic(j+1,k+1)) + abs(grayPic(j+1,k)-grayPic(j,k+1));

        if(robertsNum > robertThreshold)

            newGrayPic(j,k)=255;

        else

            newGrayPic(j,k)=0;

        end

    end

end
subplot(1,3,1), imshow(grayPic);
title('Orginal Picture')

subplot(1,3,2), imshow(newGrayPic);
title('自制的Roberts算子的处理结果')

img=rgb2gray(sourcePic);
matlabGrayPic = edge(grayPic,'Roberts');
subplot(1,3,3), imshow(matlabGrayPic);
title('matlab的Roberts算子的处理结果')
