% refim1 = imread('ref1.bmp');
% refim2 = imread('ref2.bmp');
% testim = imread('test.bmp');
refim1 = imread('Test_images/ref_2_1.bmp');
refim2 = imread('Test_images/ref_2_2.bmp');
testim = imread('Test_images/test_2.bmp');
% letsee = imread('the-flash-harrison-wells-reverse-flash-more-reverse-flash-vs-the-flash-dc-comics-305613.bmp');
% letsee = rgb2gray(letsee);
% imshow(letsee);
 ref1 = im2double(rgb2gray(refim1));
%  ref1 = im2double((refim1));
% ref1 = 1 - ref1;
 ref2 = im2double(rgb2gray(refim2));
%  ref2 = im2double((refim2));
% ref2 = 1 - ref2;
 test = im2double(rgb2gray(testim));
% test = im2double((testim));
% test = 1 - test;
tic
    %uncomment to run the search, keep one uncommented
disp('brute force search result for ref1:');
[x1, y1] = bruteForceSearch(test, ref1);
disp([x1, y1]);
disp('logarithmic search result for ref1:');
[x2, y2] = logarithmicSearch(test, ref1);
disp([x2, y2]);
disp('hierarchical search results for ref1:');
[x3, y3] = hierarchicalSearch(test, ref1, 3);
disp([x3, y3]);
toc
%disp('for ref1'); disp([x1, y1]);
tic
    %uncomment to run the search, keep one uncommented
disp('brute force search result for ref2:');
[x1, y1] = bruteForceSearch(test, ref2);
disp([x1, y1]);
disp('logarithmic search result for ref2:');
[x2, y2] = logarithmicSearch(test, ref2);
disp([x2, y2]);
disp('hierarchical search results for ref2:');
[x3, y3] = hierarchicalSearch(test, ref2, 3);
disp([x3, y3]);
toc
% disp('for ref2'); disp([x2, y2]);