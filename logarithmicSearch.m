function [ x, y ] = logarithmicSearch( testim, refer )
ref = refer(:,:,1);
test = testim(:,:,1);
%p=256;
p = ceil(size(test,1)/2);
k = ceil(log2(p));
d = 2^(k-2);
%disp(d);
cx = p;
cy = p;
%disp(cx);
%disp(cy);
while d >= 1
    %disp([cx, cy]);
    corrList = zeros(9,1);
    xchange = [-d,  0,  d, -d, 0, d, -d, 0, d];
    ychange = [-d, -d, -d,  0, 0, 0,  d, d, d];
%     xchange = [d, 0, -d, d, 0, -d,  d,  0, -d];
%     ychange = [d, d,  d, 0, 0,  0, -d, -d, -d];
    for i = 1:9
       corrList(i) = correlation(test((cx+xchange(i)):(cx+xchange(i)+size(ref,1)-1), (cy+ychange(i)):(cy+ychange(i)+size(ref,2)-1)),ref);
    end
    [ ~, maxind ] = max(corrList(:));
    %disp(maxind);
    cx = cx + xchange(maxind);
    cy = cy + ychange(maxind);
    %disp('cx = '); disp(cx);
    %disp('cy = '); disp(cy);
    d = d/2;      
end
x = cx;
y = cy;
end

