close all
clc

x = [0 1 2 3 4 5];
y_px = [237 340 410 486 551 690];
pixel_size =  0.002835;
y = y_px * pixel_size;

P = polyfit(x(1:end-1), y(1:end-1), 1);
P_bad = polyfit(x, y, 1);

std = norm((y(1:end-1) - polyval(P, x(1:end-1))))/5
err_precent = std/2/NA

plot(x, y, 'o')
hold on
plot(-1:1:6, (-1:1:6) * P(1) + P(2))
%plot(x, x * P_bad(1) + P_bad(2))
axis([-0.4 6 0.5 2])

NA = P(1)/2