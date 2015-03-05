% Read image 1
I_1 = imread('contrast max gain.jpg');

% select a channel (here red)
Red_1 = I_1(:,:,1);

% format conversion
Red_1 = double(Red_1);
 
% select a line of interest ROI (1 x 1600), here center line at y = 600,
% x is from 1 to 1600)
CenterLine = Red_1(600:600,1:1600);
 
MEAN_red = mean(mean(CenterLine))
STD_red = mean(std(CenterLine))

%plot a single line
figure 
plot(CenterLine);
 
%average over several lines 
% select a region of interest ROI with several number of lines N (N x
% 1600), x goes from 1 to 1600, averages will by taken over y from
% 600-100=500 to 600+100=700, hence over 200 lines!
ROI_Red_1  = Red_1((600-100):(600+100),1:1600);

%caculate the mean of the RIO obver several rows
N_Avg_Red_1 = mean (ROI_Red_1);

MEAN_red = mean(mean(N_Avg_Red_1))
STD_red = mean(std(N_Avg_Red_1))

%plot the averaged line
figure 
plot(N_Avg_Red_1);




