
C = [];

for path = {'../img/200.jpg', '../img/100.jpg', '../img/66.jpg', '../img/50.jpg', '../img/40.jpg', '../img/34.jpg', '../img/28.jpg', '../img/24.jpg', '../img/22.jpg', '../img/20.jpg', '../img/18.jpg', '../img/16.jpg', '../img/14.jpg', '../img/12.jpg', '../img/10.jpg', '../img/8.jpg', '../img/6.jpg', '../img/4.jpg', '../img/2.jpg'}
    I = imread(path{1});
    disp(sprintf('image: %s', path{1}))
    I = mean(I, 3);
    
    x = 500;
    y = 300;
    w = 600;
    h = 250;
    I = I(y:y+h,x:x+w);
    
    M = mean(I);
    figure
    plot(M)
    title(path{1})
    C = [C ((max(M)-min(M)) / (max(M) + min(M)))];
    disp(sprintf('\tmax: %f', max(M)))
    disp(sprintf('\tmin: %f', min(M)))
end

figure
plot(C)