%---------ϵͳ��ʶ����ҵ----------------------------------------
%�Զ���1605 ����� 1605010409
%---------ϵͳ��ʶ����ҵ----------------------------------------
%�ڶ��ַ������в�׷�
Data = UY; L = length(Data);%����������ݳ���
Jn = zeros(1,10);
t = zeros(1,10);
rm = zeros(10,10);
for n=1:1:10;
    N = L-n;
    FIA = zeros(N,2*n);%�����������
    du = zeros(n,1);
    dy = zeros(n+1,1);
    r1 = 0;r0 = 0;
for i = 1:N       %��������ֵ
    for l = 1:n*2
        if(l<=n)
            FIA(i,l) = -Data(n+i-l,2);
        elseif(n+i-l+2>0)
            FIA(i,l) = Data(n+i-l+2,1);
        end
    end
end
Y = Data(n+1:n+N,2);%������ݾ���
thita = inv(FIA'*FIA)*FIA'*Y;%�����������
    Jn0 = 0;
    for k = n+1:n+N
        for j = 1:n
            du(j) = Data(k-j,1);
            dy(j) = Data(k+1-j,2);
        end
        dy(n+1) = Data(1,2);
        E1(k) = [1,thita(1:n)']*dy-thita(n+1:2*n)'*du;
        Jn1 = Jn0+E1(k)^2; 
        %F���鷨
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
title('�в�ƽ���͡���Jn����ͼ');
subplot(2,1,2);
plot(1:1:10,t,'g');
title('F���鷨���ͼ');
figure(2);
plot(0:9,rm(1,:),'g'),hold on;
plot(0:9,rm(2,:),'b'),hold on;
plot(0:9,rm(3,:),'r');
title('�в��ɫ���׽��ͼ');
hold off;
