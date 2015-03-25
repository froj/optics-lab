close all
clc

intensities = [3303075 4646630 11691619];
bar(intensities)
set(gca,'XTickLabel',{'dark noise', '75mm', '45mm'})