clc; clear; close all; f=20;
I = im2double(imread('seg_morph.bmp'));s = size(I);
figure(1); imshow(I); title("Original image",FontSize=f);
B = im2double(imread('disc.bmp'));
Area=sum(sum(B));
[X,Y]=size(I);
[L,num]=bwlabel(I,8);
count_id=0; IID=zeros(X,Y);
count_cd=0; ICD=zeros(X,Y);
for i=1:num
    [r c]=find(L==i);
    ni=length(r);
    if ni-Area<25
        count_id=count_id+1;
        IID(find(L==i))=1;
    else
        count_cd=count_cd+1;
        ICD(find(L==i))=1;
    end
end
figure(2);imshow(IID);title(sprintf('Individual discs only (count = %d)',count_id),FontSize=f);
figure(3);imshow(ICD);title(sprintf('Connected discs only (count = %d)',count_cd),FontSize=f);
