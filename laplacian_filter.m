function [out] = laplacian_filter(in)

figure,imshow(in);
title('ORIGINAL');
out = in;
[row,col] = size(in);
len = 3;
lap_mat = [0 1 0 ;1 -4 1; 0 1 0];
m = fix(len/2);
for i=2:row-1
    for j = 2:col-1
        out(i,j) = sum(in(i-m:i+m,j-m:j+m).*lap_mat,'all');
    end
end
figure,imshow(out);
title('Laplacian');