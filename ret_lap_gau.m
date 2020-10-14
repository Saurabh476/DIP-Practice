function [out1,out2] = ret_lap_gau(in)
%It does NOT return the exact matrix as the inbuilt function would return.
%[row,col] = size(in);
len = in;
sigma = 1.0;
sig2 = sigma*sigma;
sig4 = sig2*sig2;
two_sg = 2*sig2;
m = fix(len/2);
log1 = ones(len);
log2 = ones(len);
gaus_weight = ret_gaussian_filter(len);
for x=-m:m
    for y=-m:m
        log1(x+m+1,y+m+1) = ((x*x + y*y - two_sg)/sig4)*(exp(-1*(x*x + y*y)/two_sg));
    end
end

total = sum(log1,'all');
sub_matrix = total*gaus_weight;
out1 = log1 - sub_matrix;

for x=-m:m
    for y=-m:m
        log2(x+m+1,y+m+1) = -1*(1/(3.14*sig4))*(1-((x*x + y*y)/two_sg))*(exp(-1*(x*x + y*y)/two_sg));
    end
end

total = sum(log2,'all');
sub_matrix = total*gaus_weight;
out2 = log2 - sub_matrix;