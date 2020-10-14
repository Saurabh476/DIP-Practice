function [sharpened_output_image] = unsharp_masking(in)

out = in;
[row,col] = size(in);
%original image display
figure,imshow(in);
title('Original Image');
%smoothing image
smooth_image = imgaussfilt(in,2.5);

figure,imshow(smooth_image);
title('Smooth Image');

%original image - smoothed image to get unsharp mask
unsharp_mask = in - smooth_image;
figure,imshow(unsharp_mask);
title('Unsharp Mask (Edge image)');

%sharping image using unsharp mask by scaling it 
sharpened_output_image = in + 3*unsharp_mask;
figure,imshow(sharpened_output_image);
title('Sharpened Image');