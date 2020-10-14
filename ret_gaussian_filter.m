function [gaus_filt] = ret_gaussian_filter(size,sig)
% This returns the gaussian filter for the passed size
sigma = sig;
two_sig_sq = 2*sigma*sigma;
two_pi_sig_sq = 3.14*two_sig_sq;
gaus_filt = ones(size);
m = fix(size/2);
for x=-m:m
    for y=-m:m
        gaus_filt(x+m+1,y+m+1) = exp(-(x*x + y*y)/two_sig_sq)/two_pi_sig_sq;
    end
end
total = sum(gaus_filt,'all');
for x = 1:size
    for y=1:size
        gaus_filt(x,y)=gaus_filt(x,y)/total;
    end
end