
% Read two images I1 and I2 with different exposure levels

I1 = imread('HDR max gain.jpg');
I2 = imread('HDR no gain.jpg');

% display the color images
%imagesc(I1);
%imagesc(I2);

% convert to B&W
I1 = mean(I1,3);
I2 = mean(I2,3);

figure
imagesc(I1,[0 255]); colormap(gray);
figure
imagesc(I2,[0 255]); colormap(gray);

% replace saturated pixels from I1 using the corresponding pixels from I2
%
% require
%   I1   B&W image with saturated region
%   I2   B&W image without saturation
%
% 

R = I1;

% find the saturation level of R - adjustment by 5 counts, (max(R) - 5)
m = max(max(R))-10;

% find the indices of the saturated pixels;
i = find(R > m);

% fusion of images by replacing the saturated pixel i in I1 by that from image I2
R(i) = I2(i);

% display the combined image
figure
imagesc(R,[0 255]); colormap(gray);

