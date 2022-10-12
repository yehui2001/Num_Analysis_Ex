clc;
clear;
while 1
    A=round(rand(50)*99)+1;
    b=round(rand(50,1)*99)+1;
    T=[A,b];
    if det(A) && rank(A) == rank(T)
        break
    end
end
X=[50,1];
Temp=[51,1];

for i=1:50
    max_line=i;
    for j=i+1:50  %选取绝对值最大的为列主元
        if abs(T(j,i)) > abs(T(max_line,i))
            max_line=j;
        end
    end
    
    Temp=T(i,:);
    T(i,:)=T(max_line,:);
    T(max_line,:)=Temp;
        
    for k=i+1:50  
    m_ik=T(k,i)/T(i,i); %计算系数
    T(k,i+1:51)=T(k,i+1:51)-(T(i,i+1:51).*m_ik);
    T(k,i)=0;
    end
end  %得到上三角矩阵

X(50,1)=T(50,51)/T(50,50);
for i=2:50
    X(51-i,1)=(T(51-i,51)-T(52-i,52-i:50)*X(52-i:50,1))/T(i,i);
end