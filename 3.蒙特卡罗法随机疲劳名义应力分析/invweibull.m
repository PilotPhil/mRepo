p=0:0.001:1;
n=6.02;%�߶Ȳ���scale para
k=0.98;%��״����shape para
L=icdf('weibull',p,n,k);%�غ�ֵ �ۻ��ֲ��������溯��

plot(p,L)