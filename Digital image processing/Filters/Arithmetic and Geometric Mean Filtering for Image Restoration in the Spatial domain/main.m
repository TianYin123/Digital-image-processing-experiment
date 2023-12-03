clc;
clear ;
I = imread('lena.tif');
I = rgb2gray(I);
I = im2double(I);
I = imnoise(I, 'gaussian', 0.05);   %加入高斯噪声
I1= imnoise(I, 'salt & pepper');    %加入椒盐噪声
P = imnoise(I, 'poisson');          %加入柏松噪声
%R = add_noise(I,'rayleigh',30);   %加入瑞丽噪声
%exp=add_noise(I,'exp',15);        %加入指数噪声
%G = add_noise(I,'gamma',2,10);    %加入伽马噪声
%算术均值滤波
PSF = fspecial('average', 3);   %创建预定义的二维滤波器

J = imfilter(I, PSF);
J1= imfilter(I1, PSF);
P1= imfilter(P, PSF);
%R1= imfilter(R, PSF);
%exp1=imfilter(exp, PSF);
%G1=imfilter(G, PSF);
%几何均值滤波

K = exp(imfilter(log(I), PSF));
K1 = exp(imfilter(log(I1), PSF));
P2 = exp(imfilter(log(P), PSF));
%R2 = exp(imfilter(log(R), PSF));
%exp2 = exp(imfilter(log(exp), PSF));
%G2 =exp(imfilter(log(G), PSF));

figure;
subplot(331);imshow(I);title('加入高斯噪声');
subplot(332);imshow(J);title('算术均值滤波');
subplot(333);imshow(K);title('几何均值滤波');

subplot(334);imshow(I1);title('加入椒盐噪声');
subplot(335);imshow(J1);title('算术均值滤波');
subplot(336);imshow(K1);title('几何均值滤波');

subplot(337);imshow(P);title('加入柏松噪声');
subplot(338);imshow(P1);title('算术均值滤波');
subplot(339);imshow(P2);title('几何均值滤波');

%figure;
%subplot(331);imshow(R);title('加入瑞丽噪声');
%subplot(332);imshow(R1);title('算术均值滤波');
%subplot(333);imshow(R2);title('几何均值滤波');

%subplot(334);imshow(exp);title('加入指数噪声');
%subplot(335);imshow(exp1);title('算术均值滤波');
%subplot(336);imshow(exp2);title('几何均值滤波');

%subplot(337);imshow(G);title('加入伽马噪声');
%subplot(338);imshow(G1);title('算术均值滤波');
%subplot(339);imshow(G2);title('几何均值滤波');

