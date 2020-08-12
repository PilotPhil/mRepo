% ƣ����������
% �Աຯ��
% D=FatigueLife(X)
% X���غ�����
% D�����˶�
%
% �㷨��
% 1.����������--->��ȡ���岨��--->R=findPV(X,P)
% 2.����������--->�غ����̵���--->R=seqadj(X)
% 3.����������--->�ĵ������--->R=count4P(X)
% 4.ƽ��Ӧ������--->S=goodman(Sa,Sm,Su)
% 5.�������˶�--->D=damage(S,i)

function D=FatigueLife(X)
T1=findPV(X,0);
T2=seqadj(T1);
T3=count4P(T2);
T4=goodman(T3(:,2),T3(:,3),235);
T5=damage(T4,1);
D=T5;
end

