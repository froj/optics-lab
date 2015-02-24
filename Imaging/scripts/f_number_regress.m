clc
close all

% relative focus lengths
fl = (0:0.25:1.25) * 0.333;
% spot diameters
sd = [14.2 45.4 85.1 121.9 161.6 207] / 1000;

b = polyfit(fl, sd, 1);

plot(fl, polyval(b, fl))
hold on
plot(fl, sd, 'o')

sprintf('d / z = %1.3f', b(1))