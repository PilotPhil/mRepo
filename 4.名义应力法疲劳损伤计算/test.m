% Step1. [0,1]��������������ؿ��巨�õ��غ�ֵ
p=rand(1e4,1);%��������
n=6.02;%�߶Ȳ���scale para
k=0.98;%��״����shape para
L=icdf('weibull',p,n,k);%�غ�ֵ �ۻ��ֲ��������溯��

D=FatigueLife(L');

fprintf("���ˣ�%.6f%%",100*D)