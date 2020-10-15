 %%����ģ��%%
clc;clear all;hold on;g=9.81;

% Step1:ѡ����ʵĲ���---ITTC-Modified Pierson-Moskowitz (Hs,T1)
fprintf('Step1:ѡ����ʵĲ���\n');
Hs=1.8;
T1=2;
step=0.001;%����
band=[1.5 8.5];%��1.5~8.5HzƵ�ν��е������ָ�
range=band(1):step:band(2);
S=wavespec(4,[Hs,T1],range',0);%���岨��Hs=1.5m ������������T1=2s ����ͼ
basic=struct('band',band,'S',S,'step',step);%��������

% Step2:����������Ƶ��---trapz(y)���η�����
fprintf('Step2:����������Ƶ��\n');

N=5;%�ȷ��� 2^N
fprintf('�ȷ�����%d �ȷ�������%.5f\n',2^N,trapz(S)*step/2^N);
W=band;%�ȷֵ�����
for n=1:N
    for i=1:length(W)-1%�ȷ�
        new(i)=equalParts(basic,W(i),W(i+1),0);%����ͼ
    end
    W=[W,new];%�µȷֵ����
    W=sort(W);%����
end

figure(1);
str=['N=',int2str(2^N)];%�ȷ���
plot(range,S,'b-');%��������
stem(W,wavespec(4,[Hs,T1],W',0),'rx')%���ȷ���
legend('Hs=1.5m, T1=2s',str);xlabel('\omega [rad/s]');ylabel('S(\omega) [m^2 s]');title('PMƵ������������ָ�');

% Step3:ȷ��г��Ƶ��---�����յ�һ�׾ر���׾�
fprintf('Step3:ȷ��г��Ƶ��\n');
for i=1:length(W)-1
    oom(i)=aeraOfPMW(basic,W(i),W(i+1));%һ�׾�
    zom(i)=aeraOfPM(basic,W(i),W(i+1));%��׾�
end
Wc=oom./zom;
Wc=2*pi*Wc;% ת��Ϊ��Ƶ��

% Step4:ȷ����г������
fprintf('Step4:ȷ����г������\n');
amp=(2*zom).^0.5;

% Step5:ȷ����ʼ��λ---�����[0~2pi]
fprintf('Step5:ȷ����ʼ��λ\n');
ip=(pi*2).*rand(length(amp),1,'double');%initial phase

% Step6.1:�̶��ռ�����x=1
wave=[];
x=1;
fprintf('Step6.1:�̶��ռ�����x=%.3fm\n',x);
t=(1:999)*0.2;
f=amp.*cos(Wc.^2.*(x/g)-Wc.*t'+ip');
wave1=sum(f,2);


figure(3);
plot(wave1);title('�̶��ռ�����');xlabel('t/s');ylabel('\zeta(x)/m');

% Step6.2:�̶�ʱ������t=1
wave=[];
t=1;
fprintf('Step6.2:�̶�ʱ������t=%ds\n',t);
x=0:0.01:999;
f=amp.*cos(Wc.^2.*(x'./g)-Wc.*t+ip');
wave2=sum(f,2);

figure(4);
plot(wave2);title('�̶�ʱ������');xlabel('x/m');ylabel('\zeta(t)/m');

