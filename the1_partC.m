%{
Eda Özyılmaz 2171882
Hilal Ünal 2172112
%}
clc;
clear;
image2 = imread('./THE1_images/C2.jpg');
image1 = imread('./THE1_images/C1.jpg');

sharp_filter = [0 1 0; 1 -4 1; 0 1 0];

gaussian = [1/16 1/8 1/16; 1/8 1/4 1/8; 1/16 1/8 1/16];
blur_filter = [1 4 7 4 1; 4 16 26 16 4; 7 26 41 26 7; 4 16 26 16 4; 1 4 7 4 1];
blur_filter = blur_filter./273;
sensor = [ 1/9 1/9 1/9 ; 1/9 1/9 1/9; 1/9 1/9 1/9];
sensor2 = [1/4 1/4; 1/4 1/4];
sensor4 = [ 1/16 1/16 1/16 1/16 ; 1/16 1/16 1/16 1/16;1/16 1/16 1/16 1/16;1/16 1/16 1/16 1/16];
high_pass = [1 -2 1; -2 5 -2; 1 -2 1];


n = the1_convolution(image1,gaussian);
imwrite(n,'C1_output.jpg');

m = the1_convolution(image2,sensor);
imwrite(m,'C2_output.jpg');


