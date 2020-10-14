function [in] = mean_filter(in)
% just a single mistake that we are considering the manipulated values
% to calculate new values
% Instead we should have created a new matrix and store the changed values
% into new matrix and return that new matrix. 
[row,col] = size(in);
avg_mat = ones(3)*(1/9);
figure;
imshow(in);
figure;
for i=2:row-1
    for j=2:col-1
        filter_mat = in(i-1:i+1,j-1:j+1).*avg_mat;
        in(i,j) = sum(filter_mat,'all');
    end
end
imshow(in);