% ��������
data=load('data5.txt');
subplot(4,1,1)
plot(1:length(data),data,'b')
title('ԭ��ʱ��')

subplot(4,1,2)
FTTA(data,10);
title('ԭ��Ƶ��')

% �˲�
R=filter(fff,data)

subplot(4,1,3)
plot(1:length(R),R,'b')
title("�˲���ʱ��")

subplot(4,1,4)
FTTA(R,10);
title("�˲���Ƶ��")