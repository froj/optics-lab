% close images
fclose ('all');
% Read image 1
I_1 = imread('../img/first.jpg');
I_2 = imread('../img/second.jpg');
I_Dark = imread('../img/darknoise.jpg');
% select a channel (here red)
Red_1 = I_1(:,:,1);
Red_2 = I_2(:,:,1);
Dark = I_Dark(:,:,1);
% format conversion
Red_1 = double(Red_1);
Red_2 = double(Red_2);
Dark = double(Dark);
%visiualize the image to define region of interest


% select a line of interest ROI (1 x 1600), center of peak
line = 600;
%Line1 = Red_1(line:line,1:1600);
%Line2 = Red_2(line:line,1:1600);
    
%plot a single line
%figure

%plot(Line1)
%title('First')
%xlabel('position')
%ylabel('intensity')
%axis([1 1600 0 255])
%figure
%plot(Line2)
%title('Second')
%xlabel('position')
%ylabel('intensity')

integral_dark = sum(sum(Dark))
integral_1 = sum(sum(Red_1)) - integral_dark
integral_2 = sum(sum(Red_2)) - integral_dark

ratio = integral_1/integral_2
