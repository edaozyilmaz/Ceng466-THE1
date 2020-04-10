%{
Eda Ozyilmaz 2171882
Hilal Unal 2172112
%}
clc;
clear;

%%%%B1%%%%
B1 = imread('./THE1_images/B1.jpg');
B2 = imread('./THE1_images/B2.jpg');

[B1_histmatch_output,out1,B1_hist_r,B1_hist_g,B1_hist_b] = hist(B1,B2);
imwrite(B1_histmatch_output,'B1_histmatch_output.jpg');
fig = figure('visible','off');
subplot(3,1,1),bar(B1_hist_r,'r');
subplot(3,1,2),bar(B1_hist_g,'g');
subplot(3,1,3),bar(B1_hist_b,'b');

print(fig,'B1_histmatch','-djpeg');

[B2_histmatch_output,out2,B2_hist_r,B2_hist_g,B2_hist_b] = hist(B2,B1);
imwrite(B2_histmatch_output,'B2_histmatch_output.jpg');

fig = figure('visible','off');
subplot(3,1,1),bar(B2_hist_r,'r');
subplot(3,1,2),bar(B2_hist_g,'g');
subplot(3,1,3),bar(B2_hist_b,'b');

print(fig,'B2_histmatch','-djpeg');

B3 = imread('./THE1_images/B3.jpg');
B4 = imread('./THE1_images/B4.jpg');

[B3_histmatch_output,out3,B3_hist_r,B3_hist_g,B3_hist_b] = hist(B3,B4);
imwrite(B3_histmatch_output,'B3_histmatch_output.jpg');

fig = figure('visible','off');
subplot(3,1,1),bar(B3_hist_r,'r');
subplot(3,1,2),bar(B3_hist_g,'g');
subplot(3,1,3),bar(B3_hist_b,'b');

print(fig,'B3_histmatch','-djpeg');

[B4_histmatch_output,out4,B4_hist_r,B4_hist_g,B4_hist_b] = hist(B4,B3);
imwrite(B4_histmatch_output,'B4_histmatch_output.jpg');

fig = figure('visible','off');
subplot(3,1,1),bar(B4_hist_r,'r');
subplot(3,1,2),bar(B4_hist_g,'g');
subplot(3,1,3),bar(B4_hist_b,'b');

print(fig,'B4_histmatch','-djpeg');


function [f,g,hist_r,hist_g,hist_b] = hist(B1,B2) 

height_B1 = size(B1,1);
width_B1 = size(B1,2);

height_B2 = size(B2,1);
width_B2 = size(B2,2);

%Find histogram for B1
B1_hist_red = zeros(1,256);
B1_hist_green = zeros(1,256);
B1_hist_blue = zeros(1,256);

for x=1:width_B1
    for y=1:height_B1
        red = B1(y,x,1);
        green = B1(y,x,2);
        blue = B1(y,x,3);
        
        B1_hist_red(red+1) = B1_hist_red(red+1) + 1;
        B1_hist_green(green+1) = B1_hist_green(green+1) + 1;
        B1_hist_blue(blue+1) = B1_hist_blue(blue+1) + 1;
    end
end

%Find histogram for B2
B2_hist_red = zeros(1,256);
B2_hist_green = zeros(1,256);
B2_hist_blue = zeros(1,256);

for x=1:width_B2
    for y=1:height_B2
        red = B2(y,x,1);
        green = B2(y,x,2);
        blue = B2(y,x,3);
        
        B2_hist_red(red+1) = B2_hist_red(red+1) + 1;
        B2_hist_green(green+1) = B2_hist_green(green+1) + 1;
        B2_hist_blue(blue+1) = B2_hist_blue(blue+1) + 1;
    end
end

%Cumulative histogram for B1&B2
roundsum_r = zeros(1,256);
roundsum_g = zeros(1,256);
roundsum_b = zeros(1,256);
r2=0;
b2=0;
g2=0;
sumr=0;
sumg=0;
sumb=0;
for a=1:256
    sumr = sumr + B1_hist_red(a);
    sumg= sumg + B1_hist_green(a);
    sumb = sumb + B1_hist_blue(a);
    r2 = r2 + B2_hist_red(a);
    g2 = g2 + B2_hist_green(a);
    b2 = b2 + B2_hist_blue(a);
    

    B1_hist_red(a) = sumr/(height_B1*width_B1);
    B1_hist_green(a) = sumg/(height_B1*width_B1);
    B1_hist_blue(a) = sumb/(height_B1*width_B1);
    roundsum_r(a) = round(B1_hist_red(a)*255);
    roundsum_g(a) = round(B1_hist_green(a)*255);
    roundsum_b(a) = round(B1_hist_blue(a)*255);
    B2_hist_red(a) = r2/(height_B2*width_B2);
    B2_hist_green(a) = g2/(height_B2*width_B2);
    B2_hist_blue(a) = b2/(height_B2*width_B2);
end

out = zeros(width_B1,height_B1,3,'uint8');
for x = 1:width_B1
    for y = 1:height_B1
        out(y,x,1) = roundsum_r(B1(y,x)+1);
        out(y,x,2) = roundsum_g(B1(y,x)+1);
        out(y,x,3) = roundsum_b(B1(y,x)+1);
    end
end 
g=out;

%Histogram Specification
Map1 = zeros(1,256,'uint8');
for i=1:256
    difference = abs(B1_hist_red(i)-B2_hist_red);
    [~,ind] = min(difference);
    Map1(i) = ind-1;
   
end 
Map2 = zeros(1,256,'uint8');
for i=1:256
    difference = abs(B1_hist_green(i)-B2_hist_green);
    [~,ind] = min(difference);
    Map2(i) = ind-1;
end 
Map3 = zeros(1,256,'uint8');
for i=1:256
    difference = abs(B1_hist_blue(i)-B2_hist_blue);
    [~,ind] = min(difference);
    Map3(i) = ind-1;
end 

B1_histmatch_output = zeros(height_B1,width_B1,3,'uint8');
for x=1:width_B1
    for y=1:height_B1
        B1_histmatch_output(y,x,1) = Map1(B1(y,x,1)+1);
        B1_histmatch_output(y,x,2) = Map2(B1(y,x,2)+1);
        B1_histmatch_output(y,x,3) = Map3(B1(y,x,3)+1);
    end
end

f = B1_histmatch_output;

B1_hist_r = zeros(1,256);
B1_hist_g = zeros(1,256);
B1_hist_b = zeros(1,256);
for y = 1:height_B1
    for x = 1:width_B1
        value_r = B1_histmatch_output(y, x, 1);
        value_g = B1_histmatch_output(y, x, 2);
        value_b = B1_histmatch_output(y, x, 3);

        B1_hist_r(value_r+1) = B1_hist_r(value_r+1) + 1;
        B1_hist_g(value_g+1) = B1_hist_g(value_g+1) + 1;
        B1_hist_b(value_b+1) = B1_hist_b(value_b+1) + 1;
    end
end
hist_r = B1_hist_r;
hist_g = B1_hist_g;
hist_b = B1_hist_b;

end




