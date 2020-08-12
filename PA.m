%功率谱分析分析
function Res=PA(signal,Fs)
%输入：1-信号 2-采样率

if mod(length(signal),2)%若非偶数
    signal=signal(1:end-1);
end

Fs;%采样率
T=1/Fs;%采样周期
L=length(signal);%信号长度
t=(0:L-1)*T;%时间向量

H=fft(signal);%快速傅里叶变换
P2=abs(H).^2/L;%功率谱
P1=P2(1:L/2+1);%单边谱


f=Fs*(0:L/2)/L;
plot(f,P1);
title('Single-Sided Power Spectrum');
xlabel('f(Hz)');ylabel('|P1(f)|^2');











