% ����������(��һ��Ƶ��)(Ĭ�ϻ�ͼ)
% �Աຯ��---��װ��r=xcorr(x,y)
% function Res=XCORRA(x,y)
% x     ���ź�1
% y     ���ź�2
% Res �����������

function Res=XCORRA(x,y)
% Step1.�������
[Rxyl,index]=xcorr(x,y);

% Step2.��һ��
a=x.*x;
b=y.*y;
Rxx0=sum(a);% Rxx(0)
Ryy0=sum(b);% Ryy(0)
temp=(Rxx0*Ryy0)^0.5;
Rxyl=Rxyl./temp;
Res=Rxyl;
stem(index,Rxyl,'bo');
xlabel('��λ����');
ylabel('��һ������ض�');
title('��ضȷ���');
end
