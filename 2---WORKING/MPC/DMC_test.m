% 1.��Ծ��Ӧ---N=20��������
a=[0.0867,0.2917,0.5413,0.7851,
   0.9818,1.1166,1.1882,1.2059,
   1.1846,1.1407,1.0886,1.0394,
   1.001,0.9738,0.9603,0.9577,
   0.9627,0.9721,0.9829,0.9929];
 
% 2.��̬����A �ݶ�����ʱ��P=N=20���У�,M=N=20���У�
A=zeros(20,20);
for P=1:20
    for M=1:P
        A(P,M)=a(P-M+1);
    end
end

q=0.025*ones(1,20);     % ���Ȩϵ��
r=0.025*ones(1,20);     % ����Ȩϵ��
Q=diag(q);              % ���Ȩ����
R=diag(r);              % ����ȫ����
c=zeros(20,1);
c(1)=1;
dt=c'*inv(A'*Q*A+R)*A'*Q;