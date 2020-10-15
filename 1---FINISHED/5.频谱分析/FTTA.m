% ����Ҷ�任����������(Ĭ�ϻ�ͼ)
% �Աຯ��---��װ��Y=fft(X)
% Res=FTTA(signal,Fs)
% signal���ź�
% Fs      ��������
% Re     �������׽��

function Re=FTTA(signal,Fs)
%���룺1-�ź� 2-������Ws>2Wm�ο�˹�ز�������

if mod(length(signal),2)%����ż��
    signal(end)=[];
end

Fs;%������
T=1/Fs;%��������
L=length(signal);%�źų���
t=(0:L-1)*T;%ʱ������

H=fft(signal);%���ٸ���Ҷ�任
P2=abs(H/L);%˫����
P1=P2(1:L/2+1);%������
P1(2:end-1)=2*P1(2:end-1);

grid on;hold on;
f=Fs*(0:L/2)/L;
plot(f,P1,'b-');
Re=P1; %
%[pks,locs]=findpeaks(P1,f);%��ֵ������

title('Single-Sided Amplitude Spectrum');
xlabel('f(Hz)');ylabel('|P1(f)|');
legend('SSAS');
end



%%����
% clear all;clc;
% 
% Fs=1000;%������
% T=1/Fs;%��������
% L=1500;%�źų���
% t=(0:L-1)*T;%ʱ������
% 
% 
% signal=0.7*sin(50*t)+5*sin(120*t)+2*randn(size(t));
% H=fft(signal);%���ٸ���Ҷ�任
% P2=abs(H/L);%˫����
% P1=P2(1:L/2+1);%������
% P1(2:end-1)=2*P1(2:end-1);
% 
% f=Fs*(0:L/2)/L;
% plot(f,P1);
% title('Single-Sided Amplitude Spectrum of ');
% xlabel('f(Hz)');ylabel('|P1(f)|');
