%---------ϵͳ��ʶ����ҵ----------------------------------------
%�Զ���1605 ����� 1605010409
%---------ϵͳ��ʶ����ҵ----------------------------------------
%������С���˷�
u=UY(1:800,1)';     %�������
z=UY(1:800,2)';     %�������
e=UY(1:800,3)';
P=100*eye(4);   %���Ʒ���  
Pstore=zeros(4,400);  
Pstore(:,2)=[P(1,1),P(2,2),P(3,3),P(4,4)];  
Theta=zeros(4,400);  %�����Ĺ���ֵ������м���̹�ֵ  
Theta(:,2)=[2;2;2;2];  
K=[1;1;1;1];  %����  
PE=100*eye(2);  
ThetaE=zeros(2,400);  
ThetaE(:,2)=[0.5;0.3];  
KE=[10;10];  
for i=3:400  
    h=[-z(i-1);-z(i-2);u(i-1);u(i-2)];  
    K=P*h*inv(1+h'*P*h);  
    Theta(:,i)=Theta(:,i-1)+K*(z(i)-h'*Theta(:,i-1));  
    P=(eye(4)-K*h')*P;  
    Pstore(:,i-1)=[P(1,1),P(2,2),P(3,3),P(4,4)];  
    
    he=[-e(i-1);-e(i-2)];  
    KE=PE*he*inv(1+he'*PE*he);  
    ThetaE(:,i)=ThetaE(:,i-1)+KE*(e(i)-he'*ThetaE(:,i-1));  
    PE=(eye(2)-KE*he')*PE;    

end  
disp('����a1 a2 b1 b2�Ĺ��ƽ����')  
Theta(:,400)  
disp('��������ϵ��c1 c2�Ĺ��ƽ����')  
ThetaE(:,400)  
% i=1:400;  
% figure(1)  
% plot(i,Theta(1,:),i,Theta(2,:),i,Theta(3,:),i,Theta(4,:))  
% title('�������ɹ���')  
% legend('a1','a2','b1','b2')
% figure(2)  
% plot(i,Pstore(1,:),i,Pstore(2,:),i,Pstore(3,:),i,Pstore(4,:))  
% title('���Ʒ�����ɹ���')  
% figure(3)  
% plot(i,ThetaE(1,:),i,ThetaE(2,:)); 
% title('��������ϵ�����ɹ���')  
% legend('e1','e2')


