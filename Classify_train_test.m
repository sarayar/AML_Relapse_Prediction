

filename="D:\Sara\CCIPD\AML\AML journal paper\data_train.xlsx";
filename2="D:\Sara\CCIPD\AML\AML journal paper\data_test.xlsx";


[num,txt,raw] = xlsread(filename);
%combine data as you want:
%AllData={txt;num};%as you want
AllData=num;%as you want
%save in mat file
matfileName='Train';
save(matfileName,'AllData');%In your matfile name



load('D:\Sara\CCIPD\Hadi\MIToolbox-2.1.2\Train.mat')


[num2,txt2,raw2] = xlsread(filename2);
%combine data as you want:
%AllData={txt;num};%as you want
AllData2=num2;%as you want
%save in mat file
matfileName='Test';
save(matfileName,'AllData2');%In your matfile name



load('D:\Sara\CCIPD\Hadi\MIToolbox-2.1.2\Test.mat')

data = AllData(:,1:end-1);
Group = AllData(:,end);
% 
k = 3;
%BEST = TTEST(1:3);
%BEST = WLCX(1,1:4);
% BEST = [156,180,183,32,52];%mrmr+lasso
% BEST = [164,71,77,32,52];%ttest+Lasso
% BEST = [164,71,77];%ttest
% BEST = [32,52];%LASSO
BEST = [2];%Blast_percent

Data = data(:,BEST);


data2 = AllData2(:,1:end-1);
Group2 = AllData2(:,end);
Data2 = data2(:,BEST);



lda = fitcdiscr(Data,Group,'discrimType','pseudoQuadratic');
[prediction,posteriorprob] = predict(lda,Data2);

[X,Y,~,AUC] = perfcurve(Group2,posteriorprob(:,2),1);
figure
plot(X,Y,'r','LineWidth',2)
confmat=confusionmat(Group2,prediction);
figure()
cm = confusionchart(confmat);
Accuracy= 100*trace(confmat)/sum(confmat(:));
Accuracy

%%
    SVMModel = fitcsvm(Data,Group,'KernelFunction','linear', ...
         'OutlierFraction',0.05);%0.09 % remove: 'Standardize',true,
    
    SVMModelPosteriorProb = fitSVMPosterior(SVMModel);
    
    [Y_svm_post,post_pr] = predict(SVMModelPosteriorProb,Data2);
    
    [X,Y,~,AUCsvm] = perfcurve(Group2,post_pr(:,2),1);
    plot(X,Y,'r','LineWidth',2)
confmat=confusionmat(Group2,Y_svm_post);


%%
PolyModel = fitcsvm(Data,Group,'KernelFunction','polynomial','OutlierFraction',0.095);
PolyModelPosteriorProb = fitSVMPosterior(PolyModel);
[~,score_poly] = predict(PolyModelPosteriorProb,Data2);
[X3,Y3,~,AUC_Poly] = perfcurve(Group2,score_poly(:,2),1);

