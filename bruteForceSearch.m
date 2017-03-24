function [ x, y ] = bruteForceSearch(testim, refim)
ref = refim(:,:,1);
test = testim(:,:,1);
corrMapRows = size(test,1)-size(ref,1)+1;
corrMapCols = size(test,2)-size(ref,2)+1; 
corrMap = zeros([corrMapRows,corrMapCols]);
for i = 1:corrMapRows
    for j = 1:corrMapCols
        corrMap(i,j) = correlation(test(i:i+size(ref,1)-1, j:j+size(ref,2)-1),ref);
    end
end
%corrMap = conv2(test,ref);
[ ~, maxind ] = max(corrMap(:));
[x, y] = ind2sub(size(corrMap),maxind);