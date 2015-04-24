C = [];

for img = [107 122 137 152 167 182 197 212 227 242 257 272 287 302 317 332 347 362 377 392 407 422]
    I = imread(['../img/' int2str(img) '.jpg']);
    fprintf('image: %d\n', img);
    
    Red = I(:,:,1);
    Red = double(Red);
    
    ROI_Red = Red(500:700, 400:600);
    Mean_ROI_Red = mean(ROI_Red);
    C_max = max(Mean_ROI_Red);
    C_min = min(Mean_ROI_Red);
    
    C = [C (C_max - C_min)/(C_max + C_min)];
end

dist = [107 122 137 152 167 182 197 212 227 242 257 272 287 302 317 332 347 362 377 392 407 422] / 100;
dist = dist - dist(1);

plot(dist, C, 'o-')
xlabel('mirror position [mm]')
ylabel('contrast')
