%{
Eda Özyılmaz 2171882
Hilal Ünal 2172112
%}
clc;

%%%%%A1%%%%%
A1 = imread('./THE1_images/A1.jpg');

height = size(A1,1);
width = size(A1,2);

new_A1 = zeros(width,height,3,'uint8');

A1_sh = imread('./THE1_images/A1_shrinked.jpg');

new_A1 = imresize(A1_sh,[height width],'bilinear');
imwrite(new_A1,'A1_result_bilinear.jpg');

dist_A1_bilinear = sqrt(sum((A1(:) - new_A1(:)).^2));

new_A1 = imresize(A1_sh,[height width],'bicubic');
imwrite(new_A1,'A1_result_bicubic.jpg');

dist_A1_bicubic = sqrt(sum((A1(:) - new_A1(:)).^2));

%%%%%A2%%%%%
A2 = imread('./THE1_images/A2.jpg');

height = size(A2,1);
width = size(A2,2);

new_A2 = zeros(width,height,3,'uint8');

A2_sh = imread('./THE1_images/A2_shrinked.jpg');

new_A2 = imresize(A2_sh,[height width],'bilinear');
imwrite(new_A2,'A2_result_bilinear.jpg');

dist_A2_bilinear = sqrt(sum((A2(:) - new_A2(:)).^2));

new_A2 = imresize(A2_sh,[height width],'bicubic');
imwrite(new_A2,'A2_result_bicubic.jpg');

dist_A2_bicubic = sqrt(sum((A2(:) - new_A2(:)).^2));

%%%%%A3%%%%%
A3 = imread('./THE1_images/A3.jpg');

height = size(A3,1);
width = size(A3,2);

new_A3 = zeros(width,height,3,'uint8');

A3_sh = imread('./THE1_images/A3_shrinked.jpg');

new_A3 = imresize(A3_sh,[height width],'bilinear');
imwrite(new_A3,'A3_result_bilinear.jpg');

dist_A3_bilinear = sqrt(sum((A3(:) - new_A3(:)).^2));

new_A3 = imresize(A3_sh,[height width],'bicubic');
imwrite(new_A3,'A3_result_bicubic.jpg');

dist_A3_bicubic = sqrt(sum((A3(:) - new_A3(:)).^2));
