clc;
clear;
close all;
A = [3,2,1;2,3,1;1,2,3];
b = [39;34;26];
if(det(A) ~= 0 )
    X=(A\b)';
end
ab = [A,b];%a系数矩阵，b右端项
N = 100;%迭代次数
Epsilon =1e-4;
[R,C] = size(A);
ab_D = A;
ab_L = A;
for i=1:R
    for j=1:R
        if(i~=j)
            ab_D(i,j) = 0; 
        end
        if(i>j)
            ab_L(i,j) = -ab_L(i,j);
        else
            ab_L(i,j) = 0;
        end
    end
end

ab_U = ab_D - ab_L - A;

T_J = ab_D^-1*(ab_L + ab_U);
C_J = ab_D^-1*b;

T_G = (ab_D - ab_L)^-1 * ab_U;
C_G = (ab_D-ab_L)^-1*b;

X_G = [0;0;0];
X_J = [0;0;0];
error_G = 1;
error_J = 1;


fprintf("T_G:")
Split_G(A)
fprintf("T_J:")
Split_J(A)

%判断使用方法能否迭代
%利用Jacobi或者Gauss 迭代法即可解出；
if(Split_G(A)<1)
    i = 1;
    while(error_G>=Epsilon)
        X_G(:,i+1) = T_G*X_G(:,i) + C_G;
        error_G(i) = sqrt(sum((X_G(:,i+1)-X(1,:)').^2,1));
        i = i+1;  
    end
    X_G = X_G';
    error_G
    X_G
else
    fprintf("Gauss method can't convergent")
end

if(Split_J(A)>1)
    i = 1;
    while(error_J>=Epsilon)
        X_J(:,i+1) = T_J*X_J(:,i) + C_J;
        error_J(i) = sqrt(sum((X_J(:,i+1)-X(1,:)').^2,1)); 
        i = i+1;  
    end
    X_J = X_J';
    error_J
    X_J
else
    fprintf("Jacobi method can't convergent")
end

%% 
% 

function split = Split_J(A) %用来计算|TJ|
[R,~] = size(A);
ab_D = A;
for i=1:R
    for j=1:R
        if(i~=j)
            ab_D(i,j) = 0; 
        end
    end
end

split = abs(eig(ab_D^-1 * (ab_D-A)));
split = max(split);

end
%% 
% 

function split = Split_G(A) %用来计算|TG|
    [R,~] = size(A);
    ab_D = A;
    ab_L = A;
    for i=1:R
        for j=1:R
            if(i~=j)
                ab_D(i,j) = 0; 
            end
            if(i>j)
                ab_L(i,j) = -ab_L(i,j);
            else
                ab_L(i,j) = 0;
            end
        end
    end
    ab_U = ab_D - ab_L - A;
    split = abs(eig((ab_D-ab_L)^-1 * ab_U));
    split = max(split);
end