% This code shows that hit-or-miss is not able to detect all discs but the
% one that is exactly same as the structuring element (SE). On the other hand,
% slightly erode the SE followed by erosion allows us to find all single
% discs as a set of clusters each of which has mulptile pixels. 

clc; clear; close all;
A=im2double(imread('Cells.bmp'));
B=im2double(imread('disc.bmp'));
BB=B;
BB(find(BB==0))=-1;
C0=bwhitmiss(A,BB);
C=imerode(A,B);
E=[0 1 0; 1 1 1; 0 1 0];
B1=imerode(B,E); 
C1=imerode(A,B1);

subplot(1,3,1),imshow(C0);
subplot(1,3,2),imshow(C);
subplot(1,3,3),imshow(C1);
