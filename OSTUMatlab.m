clear all
I=imread('F:/Matlab program/222.jpg');
level=graythresh(I);%原理中循环查找使得类间方差最大化的阈值步骤
BW=im2bw(I,level);
figure,imshow(BW)

map=10;

BW2=im2bw(I,map,level)
imshow(x,map),figure,imshow(BW2)

