clear all
I=imread('F:/Matlab program/222.jpg');
level=graythresh(I);%ԭ����ѭ������ʹ����䷽����󻯵���ֵ����
BW=im2bw(I,level);
figure,imshow(BW)

map=10;

BW2=im2bw(I,map,level)
imshow(x,map),figure,imshow(BW2)

