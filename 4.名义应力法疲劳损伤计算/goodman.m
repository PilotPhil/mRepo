% Goodman��ƽ��Ӧ������
% �Աຯ��
% ��һ���裺�ĵ������
% ��һ���裺���˼���
% S=goodman(Sa,Sm,Su)
% Sa��   Ӧ����ֵ
% Sm��  Ӧ����ֵ
% Su��   ����Ӧ��
% S��     Ӧ����Χ
%
% �㷨��
% S=2*Su*Sa/(Su-Sm)


function S=goodman(Sa,Sm,Su)
Su;% ����Ӧ��
Sa;% Ӧ����ֵ
Sm;% Ӧ����ֵ

%S=Su.*Sa./(Su-Sm);
S=2*Su.*Sa./(Su-Sm);
end