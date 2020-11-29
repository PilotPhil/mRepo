sim.predict_length = 20;%Ԥ�ⲽ��
sim.monitor_length = 10;%���Ʋ���
sim.num = 2;%���ݺ�������
sim.den = [1,5,1];%���ݺ�����ĸ������ʱ�䳣����
sim.Ts = 0.4;%����ʱ��0.4s
sim.N = 400;%���沽��
sim.Q = diag(1.^[1:sim.predict_length]);%���Ȩ�ؾ���
sim.R = diag(0.05.^[1:sim.monitor_length]);%����Ȩ�ؾ���
sim.h = diag(1.^[1:20]);%������������
sim.c = [1,zeros(1,sim.monitor_length-1)];%ȡ��һ��ֵ
sim.s = [[zeros(sim.predict_length-1,1),eye(sim.predict_length-1)];
[zeros(1,sim.predict_length-1),1]];%λ�ƾ���
[A,a] = get_a_matrix(sim.num,sim.den,sim.Ts,sim.predict_length,sim.monitor_length,sim.predict_length);%���㶯̬�����Լ���ģ����
sim.A = A;%��̬����
sim.y0 = a;%��ʼԤ�����
sim.a = a';%��ģ����
sim.d = sim.c*(sim.A'*sim.Q*sim.A+sim.R)^(-1)*sim.A'*sim.Q;%�����������
sim.h = 1.^[1:sim.predict_length]';%У������


myP=myProcess(2,[1,5,1],0.4);
myP.setStateGrid(-100,100,0.1);%%%�������ƹ���,�����ܶ�,�����������Լ��������㷨
target = [1*ones(1,100),1.3*ones(1,100),-2.3*ones(1,120),1.8*ones(1,80)];%�趨Ŀ��ֵ
yn_0 = sim.y0';%���ó�ʼԤ��ֵ
u_k = 0;%���ó�ʼ����
delta_u = 0;%���������������
y = zeros(1,sim.N);%�������buffer
error = zeros(1,sim.N);%�������buffer
%%%% ��ʼ���� %%%%
for t = 1:sim.N%%%����,����400��,����ʱ��0.4s
    if t+19<=sim.N
        w = target(t:t+19);
    else
        w = [target(t:sim.N),1.8*ones(1,t+19-sim.N)];%��ȡ�趨�켣
    end
    delta_u = sim.d*(w'-yn_0);%%����delta u
    u_k = u_k+delta_u;%%��������
    y_k = myP.DMC(u_k);%% ������ʵ���
    yn_1 = sim.a*delta_u+yn_0;%%����Ԥ�����
    yn_1k = yn_1(1);%ȡԤ�������һ��Ԫ��
    predict_error = y_k - yn_1k;%%����Ԥ�����
    revise_error=predict_error*sim.h;%%У��Ԥ�����
    y_cor = yn_1+revise_error;%%����У���������
    yn_0 = sim.s*y_cor;%% ���³�ʼԤ�����
    y(t)=y_k;%%��¼��ʵ���
    error(t)=target(t)-y(t);%��¼ʵʱ���
end
%%%% ���ƽ��  %%%%
plot_result(y,target,error);%%%��ͼ����


function [A,a] = get_a_matrix(num,den,Ts,N,M,P)
G = tf(num,den);%�������ݺ���
G = c2d(G,Ts);%�����ݺ�����ɢ��
% [num,den] = tfdata(G,'v');
a = step(G,1*Ts:Ts:N*Ts);%����ɢ��ģ������Ծ��Ӧ���õ���Ӧ���������ʱ��Ϊ0.4s��20��֮��ﵽ�ȶ�
a = a';%�Բ�������a����ת��
A = zeros(P,M);%��ʼ������̬����
for i = 1:P
    for j= 1:M
        if j>i
            A(i,j)=0;
        else
            A(i,j)=a(i-j+1);%�Խ�ģ�������з�������,����õ���̬����
        end
    end
end
end