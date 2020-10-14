function [out_x,out_y] = sobel_operator(in)

out_x = in;
out_y = in;
[row,col] = size(in);
sobel_x = [-1 0 1;-2 0 2;-1 0 1];
sobel_y = [1 2 1;0 0 0;-1 -2 -1];
figure,imshow(in);
title('ORIGINAL');
len=3;
m = fix(len/2);
for i=2:row-1
    for j = 2:col-1
        out_x(i,j) = sum(in(i-m:i+m,j-m:j+m).*sobel_x,'all');
    end
end
figure,imshow(out_x);
title('X-axis');
for i=2:row-1
    for j = 2:col-1
        out_y(i,j) = sum(in(i-m:i+m,j-m:j+m).*sobel_y,'all');
    end
end
figure,imshow(out_y);
title('Y-axis');