clc;
clear all;
suptitle('����ʽ����');

% % % % % % % % % % % ������ % % % % % % % % % % ,[1,fs]
[onise,noise_fs] = audioread( '����.wav');
noise_fs
subplot(5,2,1);
plot(onise);%ʱ����
title('����ʱ��');

y=fft(onise);
subplot(5,2,2);
plot(abs(y));%Ƶ����
title('����Ƶ��');

%sound(x,16000);%����

% % % % % % % % % % % %������% % % % % % % % % % 
[music, music_fs] = audioread( '�ز�.wav');
music_fs
subplot(5,2,3);
plot(music);%ʱ����
title('����ʱ��');

y1=fft(music);
subplot(5,2,4);
plot(abs(y1));%Ƶ����
title('����Ƶ��');

%sound(x1,16000);%����

% % % % % % % % % % % ���ֺͰ����� % % % % % % % % % % % 
[mix, mix_fs] = audioread( '���.wav');
subplot(5,2,5);
plot(mix);
title('���ʱ��');

y2=fft(mix);
subplot(5,2,6);
plot(abs(y2));
title('���Ƶ��');

%sound(mix,16000);%���Ż�Ϻ��

% % % % % % % % % % %��ʼ����% % % % % % % % % % %
subplot(5,2,8);
anc=y2-y;
plot(abs(anc));
title('�����Ƶ��');

anc_res= ifft(anc);
subplot(5,2,7);
plot(anc_res);
title('�����ʱ��');

%sound(anc_res);%���Ž�����
audiowrite('�����.wav',anc_res,music_fs);

mix_hand=y1+y;
subplot(5,2,10);
plot(abs(mix_hand));
title('�ֶ���ϰ�����������Ƶ��');

hand= ifft(mix_hand);
subplot(5,2,9);
plot(hand);
title('�ֶ���ϰ�����������ʱ��');
audiowrite('�ֶ���ϰ�����������.wav',hand,music_fs);

