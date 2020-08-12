%�����׷�������
function Res=PA(signal,Fs)
%���룺1-�ź� 2-������

if mod(length(signal),2)%����ż��
    signal=signal(1:end-1);
end

Fs;%������
T=1/Fs;%��������
L=length(signal);%�źų���
t=(0:L-1)*T;%ʱ������

H=fft(signal);%���ٸ���Ҷ�任
P2=abs(H).^2/L;%������
P1=P2(1:L/2+1);%������


f=Fs*(0:L/2)/L;
plot(f,P1);
title('Single-Sided Power Spectrum');
xlabel('f(Hz)');ylabel('|P1(f)|^2');











