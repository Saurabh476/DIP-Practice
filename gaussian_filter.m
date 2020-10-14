function [in] = gaussian_filter(in)
%%
% just a single mistake that we are considering the manipulated values
% to calculate new values
% Instead we should have created a new matrix and store the changed values
% into new matrix and return that new matrix. 
[row,col] = size(in);
figure,imshow(in);


%% Filter is calculated
sigma = 1.0;
two_sig_sq = 2*sigma*sigma;
two_pi_sig_sq = 3.14*two_sig_sq;
gaus_filt = ones(5);
for x=-2:2
    for y=-2:2
        gaus_filt(x+3,y+3) = exp(-(x*x + y*y)/two_sig_sq)/two_pi_sig_sq;
    end
end
total = sum(gaus_filt,'all');
for x = 1:5
    for y=1:5
        gaus_filt(x,y)=gaus_filt(x,y)/total;
    end
end
%% Filter is applied
for x=3:row-2
    for y=3:col-2
        in(x,y) = sum(in(x-2:x+2,y-2:y+2).*gaus_filt,'all');
    end
end
figure,imshow(in);

