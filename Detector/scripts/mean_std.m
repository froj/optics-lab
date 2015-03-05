% images
% Read images
for path = {'../img/black a.jpg', '../img/black b.jpg', '../img/black c.jpg', '../img/black d.jpg', '../img/max gain.jpg', '../img/no gain.jpg'}
    I = imread(path{1});
    disp(sprintf('image: %s', path{1}))
    for channel = 1:3
        MEAN = mean(mean(double(I(:,:,channel))));
        STD = mean(std(double(I(:,:,channel))));
        disp(sprintf('channel %d: mean = %f, std = %f', channel, MEAN, STD))
    end
end
