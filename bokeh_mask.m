function [blured_image] = bokeh_mask(in)
%Directly taking the mask value from inbuilt function
%COmplete this later
blured_image = in;
bok_mask = fspecial('disk',4);
[row,col] = size(in);
figure,imshow(in);
%applying mask
for x=5:row-4
    for y=5:col-4
        blured_image(x,y) = sum(in(x-4:x+4,y-4:y+4).*bok_mask,'all');
    end
end

figure,imshow(blured_image);