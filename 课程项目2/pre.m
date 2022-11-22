close all;
clear all;
a = csvread('共享单车使用量数据集.csv',1,2);
data = a(:,1:11);
cnt = a(:,14);
X=ones(731,1);
X(:,2:12)=data;
alpha= 0.005;
[b,bint,r,rint,stats] = regress(cnt,X,alpha);
for i = 1:731
y_pre = b(1);
for j = 2:12
y_pre = y_pre+b(j)*data(i,j-1);
end
cnt(i,2) = y_pre;
end
% Y_pre = X*b;
