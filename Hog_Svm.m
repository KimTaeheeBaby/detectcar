clc;clear;close all
%% ��hog������ͼ����ж���࣬svmѵ����1 VS 1    
%% 1 ���ݼ�������ѵ���ĺͲ��Ե�   
imdsTrain = imageDatastore('F:\AllofGraduation\videoTrafficData\TESTVIDIODATA\svm_images.zip\train_images',...    
    'IncludeSubfolders',true,...    
    'LabelSource','foldernames');    
imdsTest = imageDatastore('F:\AllofGraduation\videoTrafficData\TESTVIDIODATA\svm_images.zip\test_image');    
  
  
%% ��ʾѵ����ͼƬ����Labels������Count  
Train_disp = countEachLabel(imdsTrain);  
disp(Train_disp);  
    
%%   2 ��ѵ�����е�ÿ��ͼ�����hog������ȡ������ͼ��һ��    
% Ԥ����ͼ��,��Ҫ�ǵõ�features������С���˴�С��ͼ���С��Hog�����������    
imageSize = [256,256];% ������ͼ����д˳ߴ������    
image1 = readimage(imdsTrain,1);    
scaleImage = imresize(image1,imageSize); 
corners=detectFASTFeatures(rgb2gray(scaleImage));
strongest=selectStrongest(corners,5);
[hog2,validPoints,ptVis]=extractHOGFeatures(scaleImage,strongest);
figure;
imshow(scaleImage);
hold on;
plot(ptVis,'color','red');
[features, visualization] = extractHOGFeatures(scaleImage,'CellSize',[32 32]);    
subplot(1,2,1);
imshow(scaleImage);
hold on; 
subplot(1,2,2);
plot(visualization);    
    
% ������ѵ��ͼ�����������ȡ    
numImages = length(imdsTrain.Files);    
% featuresTrain = zeros(numImages,size(features,2),'single'); % featuresTrainΪ������  
featuresTrain = [];
for i = 1:numImages    
    imageTrain = readimage(imdsTrain,i);    
    imageTrain = imresize(imageTrain,imageSize);    
    featuresTrain(end+1,:) = extractHOGFeatures(imageTrain);    
end    
    
% ����ѵ��ͼ���ǩ    
trainLabels = imdsTrain.Labels;    
    
% ��ʼsvm�����ѵ����ע�⣺fitcsvm���ڶ����࣬fitcecoc���ڶ����,1 VS 1����    
classifer = fitcecoc(featuresTrain,trainLabels);    
%classifer  = fitcsvm(featuresTrain,trainLabels);
%% Ԥ�Ⲣ��ʾԤ��Ч��ͼ    

numTest = length(imdsTest.Files);    
for i = 1:numTest    
    testImage = readimage(imdsTest,i);    
    scaleTestImage = imresize(testImage,imageSize);    
    featureTest = extractHOGFeatures(scaleTestImage);    
    [predictIndex,score] = predict(classifer,featureTest);    
    figure;imshow(testImage);    
    title(['predictImage: ',char(predictIndex)]);    
end 