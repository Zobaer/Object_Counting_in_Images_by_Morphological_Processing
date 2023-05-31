clc; clear; close all;f =16;
I = imread('color_cell.bmp');I = im2double(I);IBW = imread('cells.bmp');IBW = im2double(IBW);
R = I(:,:,1);G = I(:,:,2);B = I(:,:,3);s = size(I);
%Two windows are taken manually by using data tip option of MATLAB
y_min1 = 224; y_max1 = 244; x_min1 =457; x_max1 = 471;
y_min2 = 304; y_max2 = 323; x_min2 =673; x_max2 = 690;
samples=[reshape(I(x_min1:x_max1,y_min1:y_max1,1:3),[],3);reshape(I(x_min2:x_max2,y_min2:y_max2,1:3),[],3)];
mean_val = mean(samples); covariance = cov(samples);
IM = zeros(s(1),s(2)); thresh_mahal = 3.1; thresh_eucl = .09;
for i = 1:s(1)
    for j = 1:s(2)
        x = [R(i,j), G(i,j), B(i,j)]; d = x-mean_val;
        D_mahal = sqrt(d*inv(covariance)*d'); D_eucl = sqrt(d*d');
        if min(D_mahal) < thresh_mahal
            IM(i,j) = 1;
        end
        if min(D_eucl) < thresh_eucl
            IE(i,j) = 1;
        end
    end
end
figure(1);imshow(I); title("Original color image",FontSize=f);
figure(2);imshow(IM); title("Color segmentatn using Mahalanobis dist.",FontSize=f-2);
figure(3);imshow(IE); title("Color segmentatn using Euclidean dist.",FontSize=f);
IQA_init_mahal = sum(xor(IM,IBW),'all')
IQA_init_eucl = sum(xor(IE,IBW),'all')

%Perform erosion to get rid of background noise
se1=strel('disk',1);Ierode = imerode(IM,se1);
figure(4);imshow(Ierode); title("Eroded Image",FontSize=f-2);

%Perform closing (dilation followed by erosion) to fill the gaps on discs
se2 = strel('disk',2); Iclose1 = imdilate(Ierode,se2); Iclose2 = imerode(Iclose1,se1);
figure(5);imshow(Iclose1); title("Image after erosion and dilation",FontSize=f-2);
figure(6);imshow(Iclose2); title("Final image (after erosion and closing)",FontSize=f-2);
IQA_mahal_morph1 = sum(xor(Iclose1,IBW),'all')
IQA_mahal_morph2 = sum(xor(Iclose2,IBW),'all')
imwrite(Iclose2,"seg_morph.bmp");

