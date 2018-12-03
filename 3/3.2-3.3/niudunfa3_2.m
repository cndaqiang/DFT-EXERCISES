format long
a=2 ;%初始值
dx=1e-4; %容限值 
i=0; %迭代次数
h=1/2*(1+cot(a)); % 变化
fprintf('初始值%f,容差值%f\n',a,dx')
% if exp(-a)*cos(-a)*exp(-b)*cos(-b)<0
    while abs(h)>dx
        a=a+h;
        h=1/2*(1+cot(a));
        i=i+1;
    end
fa=exp(-a)*cos(a);
fprintf('共迭代%d次，解为%f,函数值%f,导数%f\n',i,a,fa,-exp(-a)*[cos(a)+sin(a)])
%函数值，可以为