%---------ϵͳ��ʶ����ҵ----------------------------------------
%�Զ���1605 ����� 1605010409
%---------ϵͳ��ʶ����ҵ----------------------------------------
L = 100;%��һ�ַ�������AIC���׷���
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
title('AIC��״εı仯����');
xlabel('n');
ylabel('AIC');
