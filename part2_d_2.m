clc; clear; close all;f=14;I = im2double(imread('seg_morph.bmp'));s = size(I);
B = im2double(imread('disc.bmp'));Area=sum(sum(B));
[L,num]=bwlabel(I,8); E=[0 1 0; 1 1 1; 0 1 0]; countdisc = 0; Iglobal = zeros(s);
for iii = 1:num
    A = zeros(s); A(find(L==iii))=1;
    B1 = imerode(B,E); %New structuring element
    D = imerode(A,B1); [r,c] = find(D==1);
    n = length(r); %the number of white pixels in that connected component
    ranks = zeros(1,n);
    for i=1:n
        G = D; G(r(i),c(i))=0; H = imdilate(G,B1);
        ranks(i) = sum(xor(A,H),'all');
    end
    [rval, sortind] = sort(ranks,"descend"); %sort in order of ranks
    tempi = zeros(s); complast = 0;
    for i=1:length(sortind)
        tempi(r(sortind(i)), c(sortind(i))) = 1; %add the next highest ranked pixel
        J = imdilate(tempi,B1); compnew = sum(sum(J));
        if (compnew <= complast+23) %if there's no significant improvement
            %since there's no significant improvmnt aftr addin this pxl, set it to 0
            tempi(r(sortind(i)),c(sortind(i)))=0; 
        end
        complast = compnew;
    end
    countdisc = countdisc+sum(sum(tempi)); Iglobal(find(tempi==1))=1;
end
%Uncomment the following line to store the single pixel representation data
imwrite(Iglobal,'detected_disc_part2.bmp');
figure(2); imshow(Iglobal); title("Detected discs as single pixel",FontSize=f);
countdisc
count = sum(sum(Iglobal))