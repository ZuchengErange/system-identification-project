%---------ϵͳ��ʶ����ҵ----------------------------------------
%�Զ���1605 ����� 1605010409
%---------ϵͳ��ʶ����ҵ----------------------------------------
Data = UY;%�������ݾ���
%ʹ����������������2��ϵͳ���в�����ʶ
n = 2;L = length(Data);N = L-n;
U = Data(:,1);
Y = Data(:,2);
glOL =[-Y(2:L-1),-Y(1:L-2),U(2:L-1),U(1:L-2)];
Zgl1 = Data(3:L,2);
Sgl1 = glOL'*glOL;Sgl2=inv(Sgl1);Sgl3=glOL'*Zgl1;
Xsthita = Sgl2*Sgl3;%�����������
thitab0 = 0;%��ƫ�����ƫ���ֵΪ0
Fa = Sgl2*glOL';
M = eye(N)-glOL*Sgl2*glOL';
F = eye(N);
if(F>=10^-6*eye(N))
    E1 = Zgl1-glOL*Xsthita;%����в�E
    omiga(2:N,1) = -E1(1:N-1);
    omiga(3:N,2) = -E1(1:N-2);
    D = omiga'*M*omiga;
    Fx = inv(D)*omiga'*M*Zgl1;
    thitab = Fa*omiga*Fx;
    Xsthita = Xsthita - thitab;
    F = thitab - thitab0;
    thitab0 = thitab;
end
theta = [Xsthita(1) Xsthita(2) Xsthita(3) Xsthita(4)]'
% omiga(799,:)
