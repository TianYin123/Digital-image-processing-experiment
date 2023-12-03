clear;
clc;
img = imread('liulian.jpeg');
hsi = rgb2hsi(img);
HSV = rgb2hsv(img);
hsvmap = rgb2hsv(img);
rebuild1 = hsi2rgb(hsi);
rebuild2 = hsv2rgb(hsvmap);

figure;
subplot(231);imshow(img);title('RGB');
subplot(232);imshow(hsi);title('HSI');
subplot(233);imshow(HSV);title('HSV');
subplot(234);imshow(rebuild1);title('HSIrebuild');
subplot(235);imshow(rebuild2);title('HSVrebuild');

