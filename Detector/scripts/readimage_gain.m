
% Read an image
I = imread('../img/d_range_no_gain.jpg');

% display an image
figure 
imagesc(I);

% convert to B&W
I = mean(I,3);

figure 
imagesc(I,[0 255]); colormap(gray);

% select a region of interest ROI
%starting point x
x = 1200;
%starting point y
y = 100;
%width w in x direction
w = 40;
%height h in y direction
h = 60;

%region select
I = I(y:y+h,x:x+w);

%draw rectangle around ROI
hold on
plot([x x], [y y+h], 'r')
plot([x x+w], [y+h y+h], 'r')
plot([x+w x+w], [y+h y], 'r')
plot([x+w x], [y y], 'r')
hold off

%plot region of interest
%figure 
%imagesc(I,[0 255]); colormap(gray);

% mean intensity
MEAN_ROI = mean(mean(I))
STD_ROI = mean(std(I))



