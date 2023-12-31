%---------系统辨识大作业----------------------------------------
%自动化1605 韩祖成 1605010409
%---------系统辨识大作业----------------------------------------
u=UY(1:700,1)';     %输入矩阵
z=UY(1:700,2)';     %输出矩阵
%递推求解  
P=100*eye(4);   %估计方差  
Pstore=zeros(4,400);  
Pstore(:,1)=[P(1,1),P(2,2),P(3,3),P(4,4)];  
Theta=zeros(4,400);  %参数的估计值，存放中间过程估值  
Theta(:,1)=[3;3;3;3];  
Theta(:,2)=[3;3;3;3];  
Theta(:,3)=[0;0;0;0];  
Theta(:,4)=[0;0;0;0];  
%  K=zeros(4,400);  %增益矩阵  
K = [10;10;10;10];  
for i=5:400  
    h=[-z(i-1);-z(i-2);u(i-1);u(i-2)];  
    hstar=[-z(i-2-1);-z(i-2-2);u(i-1);u(i-2)];   %辅助变量  
    K=P*hstar*inv(h'*P*hstar+1);  
    Theta(:,i)=Theta(:,i-1)+K*(z(i)-h'*Theta(:,i-1));  
    P=(eye(4)-K*h')*P;  
    Pstore(:,i-1)=[P(1,1),P(2,2),P(3,3),P(4,4)];  
end
theta = Theta(:,400)  
i=1:400;  
figure(1)  
plot(i,Theta(1,:),i,Theta(2,:),i,Theta(3,:),i,Theta(4,:))  
title('辨识参数过渡过程')  
figure(2)  
plot(i,Pstore(1,:),i,Pstore(2,:),i,Pstore(3,:),i,Pstore(4,:))  
title('估计方差过渡过程')
