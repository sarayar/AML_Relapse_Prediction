


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



