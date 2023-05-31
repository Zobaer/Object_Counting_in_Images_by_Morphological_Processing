% This code can be used to show a specific connected component with a
% given a label number. 
clc; clear; close all;
I=imread('Cells.bmp');
T=imread('disc.bmp');
[X,Y]=size(I);
[L,num]=bwlabel(I,8);
J=zeros(X,Y); K=J;
J(find(L==80))=1;
K(find(L==40))=1;
subplot(1,3,1),imshow(I);
subplot(1,3,2),imshow(J);
subplot(1,3,3),imshow(K);


