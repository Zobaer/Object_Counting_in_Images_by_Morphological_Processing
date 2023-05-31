clc; clear; close all;f=16;
DD = im2double(imread('detected_disc.bmp'));
s = size(DD);
T=imread('disc.bmp');
SE=bwmorph(T,'remove');
B=imdilate(DD,T);
C=imdilate(DD,SE);
figure(1); subplot(121);imshow(C);
title("Visulization of discs using circles",Fontsize = f);
H = im2double(imread('rings_hough.bmp'));

%Add red color
HC = zeros(size(H,1), size(H,2), 3, 'uint8');
HC(:,:,1) = 255*H;
figure(1); subplot(122);imshow(HC);
title("Using Hough Transform",Fontsize = f);

%Show overlayed rings
figure(2);imshow(C);hold on; hc = imshow(HC);
set(hc, 'AlphaData', H);
