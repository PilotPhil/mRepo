clc;
clear all;

[IR,fs1]=audioread('IR.wav');%�弤��Ӧ
[talk,fs2]=audioread('talk.wav');%˵�Ļ�

mix=conv(talk,IR);%���

audiowrite('conv_res.wav',mix,fs1);%������Ƶ

y1=fft(IR);
y2=fft(talk);
y3=fft(mix);
y4=y3-y1;
y5=ifft(y4);
audiowrite('nc_res.wav',y5,fs1);%������Ƶ