%---------ϵͳ��ʶ����ҵ----------------------------------------
%�Զ���1605 ����� 1605010409
%---------ϵͳ��ʶ����ҵ----------------------------------------
%lipengboLS
%������С����
 N=600;
% U=(idinput(N,'prbs',[0 1])+1)*0.5;
% E=normrnd(0,0.1,N,1);ek=zeros(N,1);
% % y=zeros(N,1);
% for i=3:N
%     ek(i)=[E(i) E(i-1) E(i-2)]*[1 -1.5 0.7]';
% %     y(i)=[-y(i-1) -y(i-2) U(i-1) U(i-2)]*[-1.5 0.7 1 0.5]'+ek(i);
% end
U=UY(1:N,1);     %�������
y=UY(1:N,2);     %�������
e=UY(1:N,3);     %������
%e=ek;
z=[y,U];
Thita=rels(z,2,2,2,e);
x=1:N;
plot(x,Thita(1,x),'r');
hold on
plot(x,Thita(2,x),'r');
plot(x,Thita(3,x),'b');
plot(x,Thita(4,x),'g');
plot(x,Thita(5,x),'y');
plot(x,Thita(6,x),'y');
Thita(:,300)
