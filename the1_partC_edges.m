%{
Eda Özyılmaz 2171882
Hilal Ünal 2172112
%}
clc;
clear;

image2 = imread('./THE1_images/C2.jpg');
image1 = imread('./THE1_images/C1.jpg');

sacma = [-1 -1 -1; -1 8 -1;-1 -1 -1];
prewitt_x = [1 1 1;0 0 0 ;-1 -1 -1];
prewitt_y = [1 0 -1;1 0 -1;1 0 -1];
prewitt_diag = [0 1 1;-1 0 1;-1 -1 0];
sharp_filter = [0 1 0; 1 -4 1; 0 1 0];

x = the1_convolution(image1,prewitt_x);
y = the1_convolution(image1,prewitt_y);
d = the1_convolution(image1,prewitt_diag);
t = x+y+d;
%t = the1_convolution(t,sharp_filter);
imwrite(t,'C1_edges.jpg');

x = the1_convolution(image2,prewitt_x);
y = the1_convolution(image2,prewitt_y);
d = the1_convolution(image2,prewitt_diag);
t = x+y+d;
%t = the1_convolution(t,sharp_filter);
imwrite(t,'C2_edges.jpg');

