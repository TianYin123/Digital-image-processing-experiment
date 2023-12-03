clear all;

clc;

img=rgb2gray(imread('liulian.jpeg'));
img_original=img;
%imshow(img);
[m n]=size(img);
img=double(img);

%%canny边缘检测的前两步相对不复杂，所以我就直接调用系统函数了
%%高斯滤波
w=fspecial('gaussian',[5 5]);
img=imfilter(img,w,'replicate');

%figure;
%imshow(uint8(img))

%%sobel边缘检测
w=fspecial('sobel');
img_w=imfilter(img,w,'replicate');      %求横边缘
w=w';
img_h=imfilter(img,w,'replicate');      %求竖边缘
img=sqrt(img_w.^2+img_h.^2);  %注意这里不是简单的求平均，而是平方和在开方。我曾经好长一段时间都搞错了

%figure;
%imshow(uint8(img))

%%下面是非极大抑制
new_edge=zeros(m,n);
for i=2:m-1
    for j=2:n-1
        Mx=img_w(i,j);
        My=img_h(i,j);
        
        if My~=0
            o=atan(Mx/My);      %边缘的法线弧度
        elseif My==0 && Mx>0
            o=pi/2;
        else
            o=-pi/2;            
        end
        
        %Mx处用My和img进行插值
        adds=get_coords(o);      %边缘像素法线一侧求得的两点坐标，插值需要       
        M1=My*img(i+adds(2),j+adds(1))+(Mx-My)*img(i+adds(4),j+adds(3));   %插值后得到的像素，用此像素和当前像素比较 
        adds=get_coords(o+pi);%边缘法线另一侧求得的两点坐标，插值需要
        M2=My*img(i+adds(2),j+adds(1))+(Mx-My)*img(i+adds(4),j+adds(3));   %另一侧插值得到的像素，同样和当前像素比较
        
        isbigger=(Mx*img(i,j)>M1)*(Mx*img(i,j)>=M2)+(Mx*img(i,j)<M1)*(Mx*img(i,j)<=M2); %如果当前点比两边点都大置1
        
        if isbigger
           new_edge(i,j)=img(i,j); 
        end        
    end
end
%figure;
%imshow(uint8(new_edge))

%%下面是滞后阈值处理
up=220;     %上阈值 50-120-220
low=220;    %下阈值 50-100-200
set(0,'RecursionLimit',5000);  %设置最大递归深度
for i=1:m
    for j=1:n
      if new_edge(i,j)>up &&new_edge(i,j)~=255  %判断上阈值
            new_edge(i,j)=255;
            new_edge=connect(new_edge,i,j,low);
      end
    end
end
%figure;
%imshow(new_edge==255)

subplot(1,3,1), imshow(img_original);
title('原图')

subplot(1,3,2), imshow(new_edge==255);
title('自制的Canny算子的处理结果')

matlabGrayPic = edge(img,'Canny');
subplot(1,3,3), imshow(matlabGrayPic);
title('matlab的Canny算子的处理结果')
