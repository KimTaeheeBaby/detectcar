clc
clear
videoObj = VideoReader('F:/AllofGraduation/videoTrafficData/TESTVIDIODATA/ImageSet/highway.avi');%����Ƶ�ļ�
nframes = get(videoObj, 'NumberOfFrames');%��ȡ��Ƶ�ļ�֡����

for k = 1 : nframes
    currentFrame = read(videoObj, k);%��ȡ��i֡
    Frame1=read(videoObj, k+1);
    Frame2=read(videoObj, k+2);    
    disp(k)
    figure(1);
    imshow(currentFrame);

    grayFrame = rgb2gray(currentFrame);%�ҶȻ�
    grayFrame_1 = rgb2gray(Frame1);%�ҶȻ�
     grayFrame_2=rgb2gray(Frame2);
    
     difgrayFrame= grayFrame - grayFrame_1;%��֡��
    difgrayFrame2= grayFrame_1 - grayFrame_2;%��֡�� 
     fdiff1=im2bw(uint8( difgrayFrame),0.05);%����ֵ�Ƚ�ת���ɶ�ֵͼ��
    
      fdiff2=im2bw(uint8( difgrayFrame2),0.05);%����ֵ�Ƚ�ת���ɶ�ֵͼ��
      f= fdiff1&fdiff2;
     
     figure('Name','result','NumberTitle','off');
     imshow(f);
end