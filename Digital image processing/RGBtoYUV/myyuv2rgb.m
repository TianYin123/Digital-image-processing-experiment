% function rgb  = myyuv2rgb(image)
% input params.
% image: input YUV image with YUV444 format, which value must be [0 255]
% output
% rgb: 3 channels color image, value [0 255], double
%
%
% Author: KevenLee
% Contact: hudalikm@163.com
% Version: V1.0
 
function rgb  = myyuv2rgb(image)
image = im2double(image);
Y = image(:,:,1);
U = image(:,:,2);
V = image(:,:,3);
 
R = Y + 1.402.*V;
 
G = Y - 0.39*U - 0.58.*V;
 
B = Y + 2.03*U;
 
rgb(:,:,1) = R;
rgb(:,:,2) = G;
rgb(:,:,3) = B;
end