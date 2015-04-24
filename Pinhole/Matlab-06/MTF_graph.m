f = []
c = []

for data = [276 65 136; 89 65 133; 54 76 133; 43 96 141; 37 97 131; 29 113 135; 31 99 123; 24 96 108; 18 114 118; 14 120 123]';
    data
    f = [f 1/(data(1) * 0.002835)];
    c = [c (data(3) - data(2))/(data(3) + data(2))];
end

semilogy(f, c, 'o')
xlabel('spatial frequency [lines/mm]')
ylabel('contrast')