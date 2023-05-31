% This code is used to find all isolated discs that have a similar size as 
% the template of a given disc. 

clc; clear; close all;
I=imread('Cells.bmp');
T=imread('disc.bmp');
Area=sum(sum(T));
[X,Y]=size(I);
[L,num]=bwlabel(I,8);
Z=0; K=zeros(X,Y);
for i=1:num
    [r c]=find(L==i);
    [ni nj]=size(r);
    if abs(ni-Area)<20
        Z=Z+1;
     K(find(L==i))=1;
    end
end
subplot(1,2,1),imshow(I);
subplot(1,2,2),imshow(K);
Z


