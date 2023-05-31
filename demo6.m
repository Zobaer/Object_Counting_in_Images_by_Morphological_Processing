% This code is used to compute the statisitics of color distribution in a
% region and to use both Mahalanobis and Euclidean Distances to evaluate
% the distance between the color model and each pixel
clc; clear; close all;
I=im2double(imread('color_cell.bmp'));
J=I(90:120,1:100,1:3);
[x y z]=size(J);
imshow(J);
K=reshape(J,x*y,3);
mean_k=mean(K);
cov_k=cov(K);
[ox oy oz]=size(I);
O=zeros(ox,oy); P=O;
for i=1:ox
    for j=1:oy
        t(1)=I(i,j,1); t(2)=I(i,j,2); t(3)=I(i,j,3);
        d=t-mean_k;
        O(i,j)=sqrt(d*inv(cov_k)*d');    
        P(i,j)=sqrt(d*d');
    end
end
subplot(1,2,1),imshow(O,[]);
subplot(1,2,2),imshow(P,[]);

