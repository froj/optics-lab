I = imread(['../img/ZOPD_high.jpg']);

Red = I(:,:,1);
Red = double(Red);

ROI_Red = Red(500:700, 1:600);
Mean_ROI_Red = mean(ROI_Red);
mean(Mean_ROI_Red)
figure
plot(Mean_ROI_Red)
axis([0 1599 0 200])
xlabel('position [px]')
ylabel('intensity')
    