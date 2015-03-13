%close all open figure windows
fclose ('all');

PxCnts = []

% Read image 1 
for path = {'../img/Picture_40.jpg', '../img/Picture_41.jpg', '../img/Picture_42.jpg', '../img/Picture_43.jpg', '../img/Picture_44.jpg', '../img/Picture_45.jpg', '../img/Picture_46.jpg', '../img/Picture_47.jpg', '../img/Picture_48.jpg', '../img/Picture_49.jpg', '../img/Picture_50.jpg'}

    I_1 = imread(path{1});

    % select a channel (here red)
    Red_1 = I_1(:,:,1);


    % format conversion
    Red_1 = double(Red_1);
     

    % plot
    %figure
    %imagesc(Red_1,[0 255]); colormap(gray);

    % integral over intensity
    PxCnts = [PxCnts sum(sum(Red_1))];
end

plot(0:10, PxCnts/max(PxCnts), 'o-')