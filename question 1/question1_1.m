%---------ϵͳ��ʶ����ҵ----------------------------------------
%�Զ���1605 ����� 1605010409
%---------ϵͳ��ʶ����ҵ----------------------------------------
% ��ط��������������Ӧ����
N = 2^4-1;
deta = 2;  %detaΪ���������
a = 5;  %aΪ���������ֵ
M = zeros(N,N);  
for i=1:1:N
    for j=1:1:N
        M(i,j) = UY(N-i+j,1); %������M��ֵ
    end
end
Y = zeros(N,1);
for i=1:1:N
    Y(i,1)=UY(N+i-1,2); %������Y��ֵ
end
R = ones(N,N);
for i = 1:1:N
    R(i,i) = 2;     %������Rym��ֵ
end
G = (1/(a*a*(N+1)*deta))*R*M*Y;  %������ط�������ʶ������Ӧ������Ҫ��ʽ
t = 0:2:28;  %��������Ϊ2���ʰ�2��λ    
plot(t',G,'b*');   %������Ӧ����
%��������Ӧת��Ϊ���ݺ��� ���ھ������Ϊ2��ˮ��Ϊ2��ˮ�䣬��n=2
g_tem=[G(2,1) G(3,1);G(3,1) G(4,1)];  
a_bianshi=zeros(2,1);b_bianshi=zeros(2,1);%a��b������ʶ
tem=[-G(4,1);-G(5,1)];
a_bianshi=inv(g_tem)*tem;
%����b_bianshi��Ϊ2*3
 b_bianshi=[a_bianshi(1,1) 1 ;-a_bianshi(2,1) 0]*[G(2);G(3)];
% b_bianshi=[0 a_bianshi(1,1) 1;a_bianshi(1,1) a_bianshi(2,1) 0]*[G(1);G(2);G(3)];
tem=a_bianshi(1);
a_bianshi(1)=a_bianshi(2);
a_bianshi(2)=tem;
a_bianshi=a_bianshi';
b_bianshi=b_bianshi';
G1=tf([b_bianshi],[1,a_bianshi],2)
Gs = d2c(G1,'zoh')

