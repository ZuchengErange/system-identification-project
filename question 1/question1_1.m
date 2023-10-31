%---------系统辨识大作业----------------------------------------
%自动化1605 韩祖成 1605010409
%---------系统辨识大作业----------------------------------------
% 相关分析法获得脉冲响应序列
N = 2^4-1;
deta = 2;  %deta为脉冲的周期
a = 5;  %a为脉冲正输出值
M = zeros(N,N);  
for i=1:1:N
    for j=1:1:N
        M(i,j) = UY(N-i+j,1); %给矩阵M赋值
    end
end
Y = zeros(N,1);
for i=1:1:N
    Y(i,1)=UY(N+i-1,2); %给矩阵Y赋值
end
R = ones(N,N);
for i = 1:1:N
    R(i,i) = 2;     %给矩阵Rym赋值
end
G = (1/(a*a*(N+1)*deta))*R*M*Y;  %这是相关分析法辨识脉冲响应的最重要公式
t = 0:2:28;  %由于周期为2，故按2进位    
plot(t',G,'b*');   %绘制响应曲线
%有脉冲响应转换为传递函数 由于矩阵阶数为2，水箱为2阶水箱，故n=2
g_tem=[G(2,1) G(3,1);G(3,1) G(4,1)];  
a_bianshi=zeros(2,1);b_bianshi=zeros(2,1);%a，b参数辨识
tem=[-G(4,1);-G(5,1)];
a_bianshi=inv(g_tem)*tem;
%将其b_bianshi改为2*3
 b_bianshi=[a_bianshi(1,1) 1 ;-a_bianshi(2,1) 0]*[G(2);G(3)];
% b_bianshi=[0 a_bianshi(1,1) 1;a_bianshi(1,1) a_bianshi(2,1) 0]*[G(1);G(2);G(3)];
tem=a_bianshi(1);
a_bianshi(1)=a_bianshi(2);
a_bianshi(2)=tem;
a_bianshi=a_bianshi';
b_bianshi=b_bianshi';
G1=tf([b_bianshi],[1,a_bianshi],2)
Gs = d2c(G1,'zoh')

