% ����������--->������
% �Աຯ��
% R=myrainflow(X)
% X���غ�����
% R��[ѭ������ ��ֵ ��ֵ ��ʼλ ��ֹλ]
%
% �㷨��
% 1.��ȡ���岨��--->R=findPV(X,P)
% 2.�غ����̵���--->R=seqadj(X)
% 3.�ĵ������--->R=count4P(X)

function R=myrainflow(X)
% Step1.��ȡ���
tem1=findPV(X,0);
% Step2.�غ����̵���
tem2=seqadj(tem1);
% Step3.����  [Mean',Rang',Start',Stop'];% ѭ������ ��ֵ ��ֵ ��ʼλ ��ֹλ
R=count4P(tem2);% �ĵ������
end



