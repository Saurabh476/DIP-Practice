function [out] = laplacian_of_gaussian(in)
%It does NOT return the exact matrix as the inbuilt function would return.
[row,col] = size(in);
len = 5;
out = in;
%on sigma of 0.5 its clearly visible
sigma = 0.5;
sig2 = sigma*sigma;
sig4 = sig2*sig2;
two_sg = 2*sig2;
m = fix(len/2);
log = ones(len);
gaus_weight = ret_gaussian_filter(len);
figure;imshow(in);
title('Original');

%calculation the laplacian of gaussian kernal
for x=-m:m
    for y=-m:m
        log(x+m+1,y+m+1) = -1*(1/(3.14*sig4))*(1-((x*x + y*y)/two_sg))*(exp(-1*(x*x + y*y)/two_sg));
    end
end

total = sum(log,'all');
sub_matrix = total*gaus_weight;
log = log - sub_matrix;

% To compute the resultant matrix after convution(basic dot product)
for i=3:row-2
    for j=3:col-2
        out(i,j) = sum(in(i-m:i+m,j-m:j+m).*log,'all');
    end
end
figure;imshow(out);
title('LoG');
