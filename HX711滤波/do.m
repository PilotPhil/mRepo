% ��������
data=load('data5.txt');
data=data;

subplot(5,1,1)
plot(1:length(data),data,'b')
title('ԭ��ʱ��')

subplot(5,1,2)
histogram(data,1000)

subplot(5,1,3)
FTTA(data,10);
title('ԭ��Ƶ��')

% �˲�
R=filter(lp2,data);

subplot(5,1,4)
plot(1:length(R),R,'b')
title("�˲���ʱ��")

subplot(5,1,5)
FTTA(R,10);
title("�˲���Ƶ��")