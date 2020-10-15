mPend = 0.2; % �ڵ�����
mCart = 0.5; % С������
b = 0.1; % ����ϵ��
I = 0.018; % �ڵ�ת������
g = 9.8; % �������ٶ�
L = 0.3; % �ڵ����ĵ��ؽڵĽǶ�

q = (mCart+mPend)*(I+mPend*L^2)-(mPend*L)^2; % 

s = tf('s'); % ����s

% 1.�ڽǶ�/������ ���ݺ���
P_cart = (((I+mPend*L^2)/q)*s^2 - (mPend*g*L/q))/(s^4 + (b*(I + mPend*L^2))*s^3/q - ((mCart + mPend)*mPend*g*L)*s^2/q - b*mPend*g*L*s/q);

% 1.��λ��/������ ���ݺ���
P_pend = (mPend*L*s/q)/(s^3 + (b*(I + mPend*L^2))*s^2/q - ((mCart + mPend)*mPend*g*L)*s/q - b*mPend*g*L/q);

sys_tf = [P_cart ; P_pend] % ���촫�ݺ���

inputs = {'u'}; % ��������Ϊu

outputs = {'x'; 'phi'};% �������Ϊ�Ƕ���λ��

set(sys_tf,'InputName',inputs) % �����������
set(sys_tf,'OutputName',outputs)


Kp = 100;
Ki = 1;
Kd = 30;
C = pid(Kp,Ki,Kd);
T1 = feedback(P_pend,C);
t=0:0.01:4;
impulse(T1,t)
