clc;clear;close all
%% 用hog特征对图像进行多分类，svm训练，1 VS 1    
%% 1 数据集，包括训练的和测试的   
imdsTrain = imageDatastore('F:\AllofGraduation\videoTrafficData\TESTVIDIODATA\svm_images.zip\train_images',...    
    'IncludeSubfolders',true,...    
    'LabelSource','foldernames');    
imdsTest = imageDatastore('F:\AllofGraduation\videoTrafficData\TESTVIDIODATA\svm_images.zip\test_image');    
  
  
%% 显示训练的图片种类Labels和数量Count  
Train_disp = countEachLabel(imdsTrain);  
disp(Train_disp);  
    
%%   2 对训练集中的每张图像进行hog特征提取，测试图像一样    
% 预处理图像,主要是得到features特征大小，此大小与图像大小和Hog特征参数相关    
imageSize = [256,256];% 对所有图像进行此尺寸的缩放    
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
    
% 对所有训练图像进行特征提取    
numImages = length(imdsTrain.Files);    
% featuresTrain = zeros(numImages,size(features,2),'single'); % featuresTrain为单精度  
featuresTrain = [];
for i = 1:numImages    
    imageTrain = readimage(imdsTrain,i);    
    imageTrain = imresize(imageTrain,imageSize);    
    featuresTrain(end+1,:) = extractHOGFeatures(imageTrain);    
end    
    
% 所有训练图像标签    
trainLabels = imdsTrain.Labels;    
    
% 开始svm多分类训练，注意：fitcsvm用于二分类，fitcecoc用于多分类,1 VS 1方法    
classifer = fitcecoc(featuresTrain,trainLabels);    
%classifer  = fitcsvm(featuresTrain,trainLabels);
%% 预测并显示预测效果图    

numTest = length(imdsTest.Files);    
for i = 1:numTest    
    testImage = readimage(imdsTest,i);    
    scaleTestImage = imresize(testImage,imageSize);    
    featureTest = extractHOGFeatures(scaleTestImage);    
    [predictIndex,score] = predict(classifer,featureTest);    
    figure;imshow(testImage);    
    title(['predictImage: ',char(predictIndex)]);    
end 