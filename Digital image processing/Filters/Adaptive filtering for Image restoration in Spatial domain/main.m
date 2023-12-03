clc;
clear ;
I = imread('lena.tif');
I = rgb2gray(I);
I = im2double(I);
I = imnoise(I, 'gaussian', 0.05);   %加入高斯噪声
I1= imnoise(I, 'salt & pepper');    %加入椒盐噪声
P = imnoise(I, 'poisson');          %加入柏松噪声
X = imnoise(I,'speckle');           %加入乘性噪声
%算术均值滤波
[K, ~] = wiener2(I, [5, 5]);
[K1, ~] = wiener2(I1, [5, 5]);
[P1, ~] = wiener2(P, [5, 5]);
[X1, noise] = wiener2(X, [5, 5]);


figure;
subplot(421);imshow(I);title('加入高斯噪声');
subplot(422);imshow(K);title('自适应滤波');


subplot(423);imshow(I1);title('加入椒盐噪声');
subplot(424);imshow(K1);title('自适应滤波');

subplot(425);imshow(P);title('加入柏松噪声');
subplot(426);imshow(P1);title('自适应滤波');

subplot(427);imshow(X);title('加入乘性噪声');
subplot(428);imshow(X1);title('自适应滤波');