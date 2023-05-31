% This code uses the Hough transform to detect all circles. This code can
% be used as a reference to check your object counting code. 

clc; clear; close all;
%A=imread('cells.bmp');
A=imread('seg_morph.bmp');
[X,Y]=size(A);
I=zeros(X,Y);
[centers,radii]=imfindcircles(A,[12 13],'sensitivity',0.995);
subplot(1,2,1);
imshow(A);
viscircles(centers,radii);
for i=1:size(centers)
    I(ceil(centers(i,2)),ceil(centers(i,1)))=1;
end
T=imread('disc.bmp');
TB=bwmorph(T,'remove');
C=imdilate(I,TB);
subplot(1,2,2); imshow(C);
%imwrite(C,'rings_hough.bmp');
%imwrite(C,'rings_hough_part2.bmp');
size(centers)


