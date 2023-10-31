function thita=rels(z,na,nb,nc,e)
nz=length(z(:,1));
nn=na+nb+nc;
thitak=ones(nn,1)*0.001;
thita=zeros(nn,nz);
p1=eye(nn,nn)*(1.0e4);
p2=zeros(nn,nn);
K=zeros(nn,1);
  e=zeros(nz,1);
I=eye(nn);
for i=na+1:nz
    Q=[[-z(i-1:-1:i-na,1)]',[z(i-1:-1:i-nb,2)]',[e(i-1:-1:i-nc,1)]'];
    K=p1*Q'*inv(Q*p1*Q'+1);
    p2=(I-K*Q)*p1;
    thita(:,i)=thitak+K*(z(i,1)-Q*thitak); 
    p1=p2;
    thitak=thita(:,i);
    e(i)=z(i,1)-Q*thitak;
end
% Q1=zeros(nz-2,6);
% for i=na+1:nz  %写入行数
%    Q1(i-2,:)=[[-z(i-1:-1:i-na,1)]',[z(i-1:-1:i-nb,2)]',[e(i-1:-1:i-nc,1)]'];%直接写入列数
% end
% x=zeros(nz-2,1);
% x=z(3:nz,1)-z(3:nz,2);
% Thita1=zeros(6,1);
% Thita1=pinv(Q1'*Q1)*Q1'*x;
% Thita1

