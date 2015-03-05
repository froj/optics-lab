function E = averageEdge(D,r,b);
% function E = averageEdge(D,r,b);
% 
% compute the averaged edge
%
% require
%   D the data (same as input for edgeLineDetection)
%   r the edge equation given by edgeLineDetection
%   b the number of bin per pixel 
%
% return
%   E the average edge data vector including
%     x, the distance to the edge
%     m, the mean edge intensity
% 
% Eric Logean
% Created: February 09, 2011
% Last modified: February 10, 2011

% generate the x-axis coordinate relative to the edge-line
dim = size(D);
[Y X] = meshgrid(1:dim(1),1:dim(2));
X = X';
for c = 1:1:dim(1)
  X(c,:) = X(c,:) - r(1).*c - r(2);
end

% bin the result for averaging
xmin = fix(min(min(X)));
xmax = fix(max(max(X)));

len = (xmax - xmin)*b;
E = zeros(len,2);
for c = 1:1:len
  i = find(X >= c/b+xmin & X < (c/b+xmin)+1/b);
%  E(c,:) = [ c mean(D(i)) 0 length(D(i)) ];
  E(c,1) = c/b+xmin;
  E(c,2) = mean(D(i));
end

plot(E(:,1),E(:,2))
