clc;
clear ;
I = imread('lena.tif');
I = rgb2gray(I);
I = im2double(I);
I = imnoise(I, 'gaussian', 0.05);   %加入高斯噪声
I1= imnoise(I, 'salt & pepper');    %加入椒盐噪声
P = imnoise(I, 'poisson');          %加入柏松噪声
X = imnoise(I,'speckle');           %加入乘性噪声


domain = [1 1 1 1; 1 1 1 1; 1 1 1 1; 1 1 1 1];
J1 = ordfilt2(I1, 1, domain);
J2 = ordfilt2(I1, 8, domain);
J3 = ordfilt2(I1, 16, domain);

domain = [1 1 1 1; 1 1 1 1; 1 1 1 1; 1 1 1 1];
J11 = ordfilt2(I, 1, domain);
J22 = ordfilt2(I, 8, domain);
J33 = ordfilt2(I, 16, domain);

domain = [1 1 1 1; 1 1 1 1; 1 1 1 1; 1 1 1 1];
P1 = ordfilt2(P, 1, domain);
P2 = ordfilt2(P, 8, domain);
P3 = ordfilt2(P, 16, domain);

domain = [1 1 1 1; 1 1 1 1; 1 1 1 1; 1 1 1 1];
X1 = ordfilt2(X, 1, domain);
X2 = ordfilt2(X, 8, domain);
X3 = ordfilt2(X, 16, domain);


figure;
subplot(241);imshow(I);title('加入高斯噪声');
subplot(242);imshow(J1);title('最小值滤波');
subplot(243);imshow(J2);title('中值滤波');
subplot(244);imshow(J3);title('最大值滤波');

subplot(245);imshow(I1);title('加入椒盐噪声');
subplot(246);imshow(J11);title('最小值滤波');
subplot(247);imshow(J22);title('中值滤波');
subplot(248);imshow(J33);title('最大值滤波');

figure;
subplot(241);imshow(P);title('加入柏松分噪声');
subplot(242);imshow(P1);title('最小值滤波');
subplot(243);imshow(P2);title('中值滤波');
subplot(244);imshow(P3);title('最大值滤波');

subplot(245);imshow(X);title('加入乘性噪声');
subplot(246);imshow(X1);title('最小值滤波');
subplot(247);imshow(X2);title('中值滤波');
subplot(248);imshow(X3);title('最大值滤波');



