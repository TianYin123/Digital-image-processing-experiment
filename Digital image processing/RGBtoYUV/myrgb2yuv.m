% function yuv = myrgb2yuv(image)
% input params.
% image: input color image with 3 channels, which value must be [0 255]
% output
% yuv: 3 channels(YUV444, Y plane, U plane, V plane), value [0 255], double
%
%
% Author: KevenLee
% Contact: hudalikm@163.com
% Version: V1.0
 
function yuv = myrgb2yuv(image)
image = im2double(image);
R = image(:,:,1);
G = image(:,:,2);
B = image(:,:,3);

 
Y = 0.299.*R + 0.587*G + 0.114*B;
U = -0.147*R - 0.289*G + 0.436*B;
V = 0.615.*R - 0.515*G - 0.100*B;

yuv=cat(3,Y,U,V);
end