C = [];

for img = [107 137 197]
    I = imread(['../img/' int2str(img) '.jpg']);
    fprintf('image: %d\n', img);
    
    Red = I(:,:,1);
    Red = double(Red);
    
    ROI_Red = Red(500:700, 1:1599);
    Mean_ROI_Red = mean(ROI_Red);

    figure
    plot(Mean_ROI_Red)
    axis([0 1599 0 200])
    xlabel('position [px]')
    ylabel('intensity')
    
end