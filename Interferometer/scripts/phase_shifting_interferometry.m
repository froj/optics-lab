% phase shifting interferometry uses three images with a defined phase
% step.The phase should have 0, 90° and 180° shift. Interfereograms will be recombined.
% The calculation is based on subtracting interfereograms from each other. 


% Read image 1 (0°)
I_1 = imread('picture 180.jpg');
% Read image 2 (90°)
I_2 = imread('picture 182.jpg');
% Read image 3 (180°)
I_3 = imread('picture 183.jpg');

% select a channel 
Red_1 = I_1(:,:,1);
Red_2 = I_2(:,:,1);
Red_3 = I_3(:,:,1);

%plot the channel
figure
imagesc(Red_1,[0 255]);
colormap(gray)
xlabel('position [pixel]')
ylabel('position [pixel]')
figure
imagesc(Red_2,[0 255]);
colormap(gray)
xlabel('position [pixel]')
ylabel('position [pixel]')
figure
imagesc(Red_3,[0 255]);
colormap(gray)
xlabel('position [pixel]')
ylabel('position [pixel]')

% format conversion
Red_1 = double(Red_1);
Red_2 = double(Red_2);
Red_3 = double(Red_3);

% select a line of interest ROI (1 x 1600), here center line
CenterLine_Red_1 = Red_1(600:600,1:1599);
CenterLine_Red_2 = Red_2(600:600,1:1599);
CenterLine_Red_3 = Red_3(600:600,1:1599);

%plot a single line
figure 
plot(1:1:1599,CenterLine_Red_1,'g-',1:1:1599,CenterLine_Red_2,'r-',1:1:1599,CenterLine_Red_3,'b-');
xlabel('position [pixel]')
ylabel('signal [counts]')

%average over several lines (vertical)
% select a region of interest ROI with several number of lines N (N x 1600)
ROI_Red_1  = Red_1((600-100):(600+100),1:1599);
ROI_Red_2  = Red_2((600-100):(600+100),1:1599);
ROI_Red_3  = Red_3((600-100):(600+100),1:1599);

%caculate the mean of the RIO obver several rows
N_Avg_Red_1 = mean (ROI_Red_1);
N_Avg_Red_2 = mean (ROI_Red_2);
N_Avg_Red_3 = mean (ROI_Red_3);

%plot the averaged line
figure 
plot(1:1:1599,N_Avg_Red_1,'g-',1:1:1599,N_Avg_Red_2,'r-',1:1:1599,N_Avg_Red_3,'b-');
xlabel('position [pixel]')
ylabel('signal [counts]')

%calculate the tangens of the phase shifting value (I3-I2)/(I1-I2)

Tan_Int = (N_Avg_Red_3-N_Avg_Red_2)./(N_Avg_Red_1-N_Avg_Red_2);
figure 
plot(Tan_Int,'k-');
xlabel('position [pixel]')
ylabel('signal [counts]')


%creates the phase signa (arcus tangens) with values between -Pi/2 and Pi/2
phase= atan(Tan_Int);
figure
plot(phase);
xlabel('position [pixel]')
ylabel('signal [rad]')


%Calculation of the unwrapped phase and height profile 
%(unwrapping within -Pi/Pi, multiply by 2 and devide the final phase by 2)
%Dividing by 2Pi and multiply by half wavelength of 635 nm

height_profile=unwrap(2*phase)/2/(2*3.14)*0.635/2;
figure
plot(height_profile);
% axis description
xlabel('position [pixel]')
ylabel('height [micron]')



