p=rand(1e4,1);%��������
n=6.02;%�߶Ȳ���scale para
k=0.98;%��״����shape para
L=icdf('weibull',p,n,k);%�غ�ֵ �ۻ��ֲ��������溯��
L=findPV(L',0);
L=seqadj(L);
L=L';
csvwrite('testData.csv',L)