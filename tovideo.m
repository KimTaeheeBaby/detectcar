clc;clear;close all

%path='F:\AllofGraduation\videoTrafficData\TESTVIDIODATA\ImageSet\badWeather\badWeather\wetSnow\input\';% ·����1
path='F:\AllofGraduation\videoTrafficData\TESTVIDIODATA\ImageSet\Wallflower dataset\LightSwitch\';
prefix='b';%ǰ׺
suffix='.bmp';%��׺
WriterObj=VideoWriter('F:\AllofGraduation\videoTrafficData\TESTVIDIODATA\ImageSet\LightSwitch.avi');% xxx.avi��ʾ���ϳɵ���Ƶ����������avi��ʽ�����ļ�·��
WriterObj.FrameRate=25;
WriterObj.Quality=100;
open(WriterObj);

N=2714;%һ���ж���֡
n=5;
tempStr=['%0',num2str(n),'d'];
for i=1:N % n_frames��ʾͼ��֡������
    frame=imread([path,prefix,num2str(i,tempStr),suffix]);% ��ȡͼ�񣬷��ڱ���frame��
    writeVideo(WriterObj,frame);% ��frame�ŵ�����WriterObj��
end
close(WriterObj);



% route='F:\AllofGraduation\videoTrafficData\TESTVIDIODATA\ImageSet\highway\highway\input';%����·��  
% name='in000001.jpg';%  
% d=dir([route name '\imgs\*.jpg']);%.jpg��ʽ  
%   
% WriterObj=VideoWriter('F:\AllofGraduation\videoTrafficData\TESTVIDIODATA\ImageSet\highway.avi');%���ϳɵ���Ƶ(��������avi��ʽ)���ļ�·��  
% open(WriterObj);  
%   
% n_frames=numel(d);% n_frames��ʾͼ��֡������  
% for i=1:1701   
% frame=imread([route name '\F:\AllofGraduation\videoTrafficData\TESTVIDIODATA\ImageSet\highway\highway\input\' d(i).name]);%��ȡͼ�񣬷��ڱ���frame��  
% writeVideo(WriterObj,frame);%��frame�ŵ�����WriterObj��  
% %%Ϊÿһ֡ͼ����  
% %imshow(frame);  
% %text(5,18,num2str(i),'color','y','Fontweight','bold','FontSize',18);  
% %writeVideo(WriterObj,frame2im(getframe(gcf)));  
% end  
% close(WriterObj);  