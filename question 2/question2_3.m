%---------系统辨识大作业----------------------------------------
%自动化1605 韩祖成 1605010409
%---------系统辨识大作业----------------------------------------
%最小二一次完成算法
u=UY(1:201,1)';     %输入矩阵
z=UY(1:201,2)';     %输出矩阵
H=zeros(150,4); 
for i=1:150
    H(i,1)=-z(i+1); 
    H(i,2)=-z(i); 
    H(i,3)=u(i+1); 
    H(i,4)=u(i); 
end 
Theta=inv(H'*H)*H'*(z(3:152))'
