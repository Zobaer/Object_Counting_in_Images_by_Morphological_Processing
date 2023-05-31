% This code can be used to show all detected discs by their contours. 
% This is done by creating an image A where all discs are identified as white
% white pixels, and followed by a dilation with a circle-shaped SE 

A=zeros(100,100);
T=imread('disc.bmp');
SE=bwmorph(T,'remove');
A(20,15)=1; A(15,20)=1;  
A(30,15)=1; A(15,30)=1; 
A(30,30)=1; A(30,50)=1; 
A(50,30)=1; A(50,50)=1; 
B=imdilate(A,T);
C=imdilate(A,SE);
subplot(1,3,1),imshow(B);
subplot(1,3,2),imshow(A);
subplot(1,3,3),imshow(C); 
