%{
Eda Özyılmaz 2171882
Hilal Ünal 2172112
%}


function f = the1_convolution(img, filter)
    height = size(img,1);
    width = size(img,2);
    
    
    filter_height = size(filter,1);
    filter_width = size(filter,2);
    
    
    h = rot90(filter,2);
    center = floor((size(h)+1)/2);
    left = center(2)-1;
    right = filter_width -center(2);
    top = center(1)-1;
    bottom = filter_height - center(1);
    
    Rep = zeros(height+top+bottom, width+left+right,3);
    for i=1+top:height+top
        for j=1+left:width+left
            Rep(i,j,1) = img(i-top,j-left,1);
            Rep(i,j,2) = img(i-top,j-left,2);
            Rep(i,j,3) = img(i-top,j-left,3);
        end
    end
    f = zeros(height,width,3,'uint8');
    for i=1:(height)
        for j=1:(width)
            for m=1:filter_height
                for n=1:filter_width
                    f(i,j,1) = f(i,j,1) + Rep(i+m-1,j+n-1,1).*filter(m,n);
                    f(i,j,2) = f(i,j,2) + Rep(i+m-1,j+n-1,2).*filter(m,n);
                    f(i,j,3) = f(i,j,3) + Rep(i+m-1,j+n-1,3).*filter(m,n);
                end
            end
        end
    end
    
end