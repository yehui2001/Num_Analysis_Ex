%% 非线性方程组 - Newton 解法

%% CLEAR
clc;
clearvars;
close all;
 
%% 符号及方程组定义
% syms x1 x2;
% f1(x1,x2) = x1^2+x2^2-5;
% f2(x1,x2) = (x1+1)*x2-(3*x1+1);
%  
% F(x1,x2) = [f1;f2];
%  
% f1_x1_Pd(x1,x2) = diff(f1,x1);% f1 对 x1 求偏导
% f1_x2_Pd(x1,x2) = diff(f1,x2);% f1 对 x2 求偏导
% f2_x1_Pd(x1,x2) = diff(f2,x1);% f2 对 x1 求偏导
% f2_x2_Pd(x1,x2) = diff(f2,x2);% f2 对 x2 求偏导
%  
% J(x1,x2)=[f1_x1_Pd,f1_x2_Pd;...
%           f2_x1_Pd,f2_x2_Pd];% F(x)的 Jacobi 矩阵

% syms x1 x2;
% % f1(x1,x2) = x1^2 - 10*x1 + x2^2 + 8;
% % f2(x1,x2) = x1*x2^2 + x1 - 12*x2 + 7;
% f1(x1,x2) = x1^2+x2^2-5;
% f2(x1,x2) = (x1+1)*x2-(3*x1+1);
%  
% F(x1,x2) = [f1;f2];
%  
% df1_x1(x1,x2) = diff(f1,x1);% f1 对 x1 求偏导
% df1_x2(x1,x2) = diff(f2,x2);% f1 对 x2 求偏导
% df2_x1(x1,x2) = diff(f1,x1);% f2 对 x1 求偏导
% df2_x2(x1,x2) = diff(f2,x2);% f2 对 x2 求偏导
%  
% J(x1,x2)=[df1_x1,df1_x2;df2_x1,df2_x2];%F(x)的导函数Jacobi 矩阵
%% 符号及方程组定义
     


