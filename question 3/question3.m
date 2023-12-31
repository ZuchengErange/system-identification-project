%---------系统辨识大作业----------------------------------------
%自动化1605 韩祖成 1605010409
%---------系统辨识大作业----------------------------------------
clc,clear all
L=200; % M序列的长度
y1=1;y2=1;y3=1;y4=1;%4个移位积存器的输出初始值
for i=1:L %开始循环，长度为L
    x1=xor(y3,y4);
    x2=y1; x3=y2; x4=y3; y(i)=y4;
    if y(i)>0.5
        u1(i)=1; %如果M序列的值为"1"时,%辨识的输入信号取“-1”
    else
        u1(i)=0; %当M序列的值为"0"时.辨识的输入信号取“1”
    end
    y1=x1;y2=x2;y3=x3;y4=x4; %为下一次的输入信号做准备
end %大循环结束，产生输入信号u
y1=1;y2=0;y3=1;y4=1;
for i=1:L %开始循环，长度为L
    x1=xor(y3,y4);
    x2=y1; x3=y2; x4=y3; y(i)=y4;
    if y(i)>0.5
        u2(i)=1; %如果M序列的值为"1"时,%辨识的输入信号取“-1”
    else
        u2(i)=0; %当M序列的值为"0"时.辨识的输入信号取“1”
    end
    y1=x1;y2=x2;y3=x3;y4=x4; %为下一次的输入信号做准备
end %大循环结束，产生输入信号u

%高斯白噪声，长度为L
v1=0*randn(1,L);
v2=0*randn(1,L);
Y1(2)=0.1;Y1(1)=0.1; %取Y的前两个初始值为零
Y2(2)=0.1;Y2(1)=0.1; %取Y的前两个初始值为零
for k=3:L
Y1(k)=-0.5*Y1(k-1)+0.2*Y2(k-1)-1.2*Y1(k-2)+0.6*Y2(k-2)+u1(k)+0.5*u1(k-1)-0.4*u2(k-1)+0.4*u1(k-2)-0.3*u2(k-2)+v1(k);
Y2(k)=0.3*Y1(k-1)-0.6*Y2(k-1)-0.1*Y1(k-2)+0.6*Y2(k-2)+u2(k)+0.2*u1(k-1)-0.3*u2(k-1)-0.2*u1(k-2)+0.1*u2(k-2)+v2(k);
end
Y=[Y1;Y2];
U=[u1;u2];
N=150; n=2;
A1=[0.5 -0.2;-0.3 0.6];
A2=[1.2 -0.6;0.1 -0.6];
B0=[1.0 0.0;0.0 1.0];
B1=[0.5 -0.4;0.2 -0.3];
B2=[0.4 -0.3;-0.2 0.1];
c0=zeros(10,1); %被辨识参数矩阵的初始值
c0 =[3 3 3 3 3 3 3 3 3 3];
c0=[c0;c0];  %构造系数矩阵
H=zeros(N-n,4*n+2);
c=c0;
c=c';
for j=1:2
%重写给H赋值的函数
for k=1+n:N  %给每一行赋值
    for i=1:(2*n+1) %给每两列赋值
        if i<=2
        H(k-n,2*i-1:2*i)=-Y(:,k-i)';
        else
        H(k-n,2*i-1:2*i)=U(:,k-i+3)';   
        end
    end
end
     tem=H'*H;
     tem1=rank(tem);
     c(:,j)=pinv(tem)*H'*Y(j,1+n:N)';
end
c=c';
y_tem=H*c';
y_tem=y_tem';
disp('矩阵a1结果为');
a1=c(1:2,1:2)
disp('矩阵a2结果为');
a2=c(1:2,3:4)
disp('矩阵b0结果为');
b0=c(1:2,5:6)
disp('矩阵b1结果为');
b1=c(1:2,7:8)
disp('矩阵b2结果为');
b2=c(1:2,9:10)
