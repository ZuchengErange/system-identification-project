%---------系统辨识大作业----------------------------------------
%自动化1605 韩祖成 1605010409
%---------系统辨识大作业----------------------------------------
L = 100;%第一种方法——AIC定阶方法
U = UY(:,1);
Y = UY(:,2);
for n = 1:1:5
        N = 100-n;
        yd(1:N,1) = Y(n+1:n+N);
        for i=1:N      
            for l=1:1:2*n   
                if(l<=n)
                  FIA(i,l) = -Y(n+i-l);
                  else
                  FIA(i,l) = U(2*n+i-l);
                end
            end
        end
        thita = inv(FIA'*FIA)*FIA'*yd;
        omiga = (yd-FIA*thita)'*(yd-FIA*thita)/N;
        AIC(n) = N*log(omiga)+4*n;
end
plot(AIC,'-');
title('AIC随阶次的变化曲线');
xlabel('n');
ylabel('AIC');
