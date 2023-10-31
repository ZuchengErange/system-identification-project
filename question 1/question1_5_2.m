%---------系统辨识大作业----------------------------------------
%自动化1605 韩祖成 1605010409
%---------系统辨识大作业----------------------------------------
%第二种方法，残差定阶法
Data = UY; L = length(Data);%输入输出数据长度
Jn = zeros(1,10);
t = zeros(1,10);
rm = zeros(10,10);
for n=1:1:10;
    N = L-n;
    FIA = zeros(N,2*n);%构造测量矩阵
    du = zeros(n,1);
    dy = zeros(n+1,1);
    r1 = 0;r0 = 0;
for i = 1:N       %测量矩阵赋值
    for l = 1:n*2
        if(l<=n)
            FIA(i,l) = -Data(n+i-l,2);
        elseif(n+i-l+2>0)
            FIA(i,l) = Data(n+i-l+2,1);
        end
    end
end
Y = Data(n+1:n+N,2);%输出数据矩阵
thita = inv(FIA'*FIA)*FIA'*Y;%计算参数矩阵
    Jn0 = 0;
    for k = n+1:n+N
        for j = 1:n
            du(j) = Data(k-j,1);
            dy(j) = Data(k+1-j,2);
        end
        dy(n+1) = Data(1,2);
        E1(k) = [1,thita(1:n)']*dy-thita(n+1:2*n)'*du;
        Jn1 = Jn0+E1(k)^2; 
        %F检验法
        t(n) = abs((Jn0-Jn1)/Jn1*(N-2*n-2)/2);
        Jn0 = Jn1;
    end
    Jn(n) = Jn0;
    for m = 0:1:9
        for m2 = n+1:1:L-m
            r1 = r1+E1(m2)*E1(m2+m)/(L-m-n);
            r0 = r0+E1(m2)^2/(L-m-n);
        end
        rm(n,m+1) = r1/r0;
    end
end
subplot(2,1,1);
plot(1:10,Jn,'r');
title('残差平方和——Jn曲线图');
subplot(2,1,2);
plot(1:1:10,t,'g');
title('F检验法结果图');
figure(2);
plot(0:9,rm(1,:),'g'),hold on;
plot(0:9,rm(2,:),'b'),hold on;
plot(0:9,rm(3,:),'r');
title('残差白色定阶结果图');
hold off;
