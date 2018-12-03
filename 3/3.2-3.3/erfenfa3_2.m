format long
a=2 ;%左端
b=3 ;%右端
dx=1e-4; %容限值 
i=0; %迭代次数
fprintf('a=%f,b=%f,容差值%f\n',a,b,dx')
% if exp(-a)*cos(-a)*exp(-b)*cos(-b)<0
    while abs(a-b)>dx
    ga=-exp(-a)*[cos(a)+sin(a)];
    gb=-exp(-a)*[cos(a)+sin(a)];
    c=(a+b)/2;
    gc=-exp(-c)*[cos(c)+sin(c)];;
    if ga*gc>0
        a=c;
    else
        b=c;
    end
    i=i+1;
    end 
% else
%     
% end
fa=exp(-a)*cos(a);
fprintf('共迭代%d次，解为%f,函数值%f,导数%f\n',i,a,fa,ga)
    
    
