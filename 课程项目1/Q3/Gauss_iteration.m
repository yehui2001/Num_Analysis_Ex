clc;
clear;
while 1
%创建30阶随机方阵，元素取值1-100
    A=round(rand(30)*99)+1;
    D=zeros(30);
    U=zeros(30);
    L=zeros(30);
    B=round(rand(30,1)*99)+1; 
    
%将D-U-L变为对角占优矩阵，使得满足迭代条件
    for j=1:29
        U(j,j+1)=-A(j,j+1);
        L(j+1,j)=-A(j+1,j);
    end
    
    D(1,1)=sum(abs(A(1,1:2)))+10*rand(1);
    for i=2:29
        D(i,i)=sum(abs(A(i,i-1:i+1)))+10*rand(1);
    end
    D(30,30)=sum(abs(A(30,29:30)))+10*rand(1);

    T=((D-L)^(-1))*U;
    C=(D-L)^(-1);
        
    if max(abs(eig(T)))<1  %检查系数矩阵特征值
        break
    end
end    
Xn=zeros(30,1);  %存储当前的迭代结果
Xn_1=ones(30,1);  %存储上一次的迭代结果
while sqrt(sum(abs(Xn-Xn_1).^2))>0.001
    Xn_1=Xn;
    for j=1:30
        Xn(j,1)=T(j,:)*Xn+C(j,:)*B;
    end
    fprintf('Xn = %f\n',Xn);
end