clc
clear
videoObj = VideoReader('F:/AllofGraduation/videoTrafficData/TESTVIDIODATA/ImageSet/highway.avi');%读视频文件
nframes = get(videoObj, 'NumberOfFrames');%获取视频文件帧个数

for k = 1 : nframes
    currentFrame = read(videoObj, k);%读取第i帧
    Frame1=read(videoObj, k+1);
    Frame2=read(videoObj, k+2);    
    disp(k)
    figure(1);
    imshow(currentFrame);

    grayFrame = rgb2gray(currentFrame);%灰度化
    grayFrame_1 = rgb2gray(Frame1);%灰度化
     grayFrame_2=rgb2gray(Frame2);
    
     difgrayFrame= grayFrame - grayFrame_1;%邻帧差
    difgrayFrame2= grayFrame_1 - grayFrame_2;%邻帧差 
     fdiff1=im2bw(uint8( difgrayFrame),0.05);%与阈值比较转换成二值图像
    
      fdiff2=im2bw(uint8( difgrayFrame2),0.05);%与阈值比较转换成二值图像
      f= fdiff1&fdiff2;
     
     figure('Name','result','NumberTitle','off');
     imshow(f);
end