clc;clear;close all

%path='F:\AllofGraduation\videoTrafficData\TESTVIDIODATA\ImageSet\badWeather\badWeather\wetSnow\input\';% 路径名1
path='F:\AllofGraduation\videoTrafficData\TESTVIDIODATA\ImageSet\Wallflower dataset\LightSwitch\';
prefix='b';%前缀
suffix='.bmp';%后缀
WriterObj=VideoWriter('F:\AllofGraduation\videoTrafficData\TESTVIDIODATA\ImageSet\LightSwitch.avi');% xxx.avi表示待合成的视频（不仅限于avi格式）的文件路径
WriterObj.FrameRate=25;
WriterObj.Quality=100;
open(WriterObj);

N=2714;%一共有多少帧
n=5;
tempStr=['%0',num2str(n),'d'];
for i=1:N % n_frames表示图像帧的总数
    frame=imread([path,prefix,num2str(i,tempStr),suffix]);% 读取图像，放在变量frame中
    writeVideo(WriterObj,frame);% 将frame放到变量WriterObj中
end
close(WriterObj);



% route='F:\AllofGraduation\videoTrafficData\TESTVIDIODATA\ImageSet\highway\highway\input';%基本路径  
% name='in000001.jpg';%  
% d=dir([route name '\imgs\*.jpg']);%.jpg格式  
%   
% WriterObj=VideoWriter('F:\AllofGraduation\videoTrafficData\TESTVIDIODATA\ImageSet\highway.avi');%待合成的视频(不仅限于avi格式)的文件路径  
% open(WriterObj);  
%   
% n_frames=numel(d);% n_frames表示图像帧的总数  
% for i=1:1701   
% frame=imread([route name '\F:\AllofGraduation\videoTrafficData\TESTVIDIODATA\ImageSet\highway\highway\input\' d(i).name]);%读取图像，放在变量frame中  
% writeVideo(WriterObj,frame);%将frame放到变量WriterObj中  
% %%为每一帧图像编号  
% %imshow(frame);  
% %text(5,18,num2str(i),'color','y','Fontweight','bold','FontSize',18);  
% %writeVideo(WriterObj,frame2im(getframe(gcf)));  
% end  
% close(WriterObj);  