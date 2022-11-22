clc;clear;close all;format long;
h_step = pi/30;
t_step = 1/300;

[h,t]=meshgrid(0:h_step:4*pi,0:t_step:2);
z = exp(-t).*sin(h);PDE = zeros(size(z));
u = @(h,t)exp(-t).*sin(h);
%%
figure;
subplot(1,3,1);title('RAW');
meshc(h,t,z)
hold on
set(gca,'ylim',[0 1],'zlim',[min(min(z)),max(max(z))])
%%
[R,C]=size(PDE);
x = h(1,:);y = t(:,1);
PDE(1,:) = sin(x);PDE(:,[1,C]) = 0;%%Edge Condition
for i = 2:R
    for j = 2:C-1
        PDE(i,j) = PDE(i-1,j) + t_step/(h_step^2)*(PDE(i-1,j-1) - 2*PDE(i-1,j) + PDE(i-1,j+1));
    end
end
%PDE(abs(PDE)>1) = 0;
%%
subplot(1,3,2);title('PDE');
meshc(h,t,PDE)
set(gca,'ylim',[0 1],'zlim',[min(min(z)),max(max(z))])
%%
error = abs(PDE-z);

%% Error
subplot(1,3,3);
meshc(h,t,error)
set(gca,'ylim',[0 1],'zlim',[min(min(error)),max(max(error))])

colormap cool;
