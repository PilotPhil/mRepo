function u = MPCcontroller(pos_ref, pos, vel)
%��������
m    = 1.05;          %��������,������5%��Ϊ��ģ���
T    = 0.01;          %��������10ms
p    = 45;            %����ʱ��Ԥ��ʱ��
Q    = 10*eye(2*p);   %״̬���Ȩ��
W    = 0.0001*eye(p); %�������Ȩ��
umax = 100;           %���������ƣ���������
Rk   = zeros(2*p,1);  %�ο�ֵ����
Rk(1:2:end) = pos_ref;%�ο�λ���ɺ�������ָ��
Rk(2:2:end) = vel;    %�ο��ٶȸ���ʵ���ٶ�
%�����м����
xk    = [pos;vel];    %xk
A_    = [1 T;0 1];    %��ɢ��Ԥ��ģ�Ͳ���A
B_    = [0;T/m];      %��ɢ��Ԥ��ģ�Ͳ���B
psi   = zeros(2*p,2); %psi
for i=1:1:p
    psi(i*2-1:i*2,1:2)=A_^i;
end
theta = zeros(2*p,p);     %theta
for i=1:1:p
    for j=1:1:i
        theta(i*2-1:i*2,j)=A_^(i-j)*B_;
    end
end
E = psi*xk-Rk;            %E
H = 2*(theta'*Q*theta+W); %H
f = (2*E'*Q*theta)';      %f
%�Ż����
coder.extrinsic('quadprog');
Uk=quadprog(H,f,[],[],[],[],-umax,umax);
%���ؿ��������е�һ��ֵ
u = 0.0;                %ָ��u������
u = Uk(1);              %��ȡ�������е�һ��