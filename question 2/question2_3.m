%---------ϵͳ��ʶ����ҵ----------------------------------------
%�Զ���1605 ����� 1605010409
%---------ϵͳ��ʶ����ҵ----------------------------------------
%��С��һ������㷨
u=UY(1:201,1)';     %�������
z=UY(1:201,2)';     %�������
H=zeros(150,4); 
for i=1:150
    H(i,1)=-z(i+1); 
    H(i,2)=-z(i); 
    H(i,3)=u(i+1); 
    H(i,4)=u(i); 
end 
Theta=inv(H'*H)*H'*(z(3:152))'