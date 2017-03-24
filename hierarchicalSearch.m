function [ x, y ] = hierarchicalSearch( testim, refim, noOfLevels )
% maxLevel = ceil(log2(min(size(refim,1), size(refim,2))));
% if noOfLevels > maxLevel
%     disp('the number of levels is too high');
%     noOfLevels = maxLevel;
% end
refim = double(refim);
testim = double(testim);
ref = refim(:,:,1);
test = testim(:,:,1);
imList = cell(noOfLevels+1,2);
imList{1,1} = test;
imList{1,2} = ref;
for i = 2:noOfLevels+1
    stest = imList{i-1,1}(1:2:end, 1:2:end);
    sref = imList{i-1,2}(1:2:end, 1:2:end);
    stest = imgaussfilt(stest, 1);
    sref = imgaussfilt(sref, 1);
    imList{i,1} = stest;
    imList{i,2} = sref;
end
[xm, ym] = bruteForceSearch(imList{end,1}, imList{end,2});
x = xm - ceil(size(imList{end,1},1)/2);
y = ym - ceil(size(imList{end,1},2)/2);
for i = noOfLevels:-1:1
    imtest = imList{i,1};
    imref = imList{i,2};
    cx = ceil(size(imtest,1)/2) + 2*x;
    cy = ceil(size(imtest,2)/2) + 2*y;
    corrList = zeros(9,1);
    xchange = [-1,  0,  1, -1, 0, 1, -1, 0, 1];
    ychange = [-1, -1, -1,  0, 0, 0,  1, 1, 1];
    for j = 1:9
       corrList(j) = correlation(imtest((cx+xchange(j)):(cx+xchange(j)+size(imref,1)-1), (cy+ychange(j)):(cy+ychange(j)+size(imref,2)-1)),imref);
    end
    [ ~, maxind ] = max(corrList(:));
    x = cx + xchange(maxind);
    y = cy + ychange(maxind);
    x = x - ceil(size(imtest,1)/2);
    y = y - ceil(size(imtest,2)/2);
end
x = x + ceil(size(test,1)/2);
y = y + ceil(size(test,2)/2);
end

