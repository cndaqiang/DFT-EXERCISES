format long
a=10 ;%初始值
dx=1e-4; %容限值 
i=0; %迭代次数
h=-(1+a^2)*atan(a); % 变化
fprintf('初始值%f,容差值%f\n',a,dx')
% if exp(-a)*cos(-a)*exp(-b)*cos(-b)<0
    while abs(h)>dx
        a=a+h;
        h=-(1+a^2)*atan(a);
        i=i+1;
    end

fprintf('共迭代%d次，解为%f,导数%f\n',i,a,atan(a))
%函数值，可以为