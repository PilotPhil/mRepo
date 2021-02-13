% Step1. [0,1]��������������ؿ��巨�õ��غ�ֵ
p=rand(100,1);%��������
n=6.02;%�߶Ȳ���scale para
k=0.98;%��״����shape para
L=icdf('weibull',p,n,k);%�غ�ֵ �ۻ��ֲ��������溯��

csvwrite('testData.csv',L)
L=findPV(L',1);

[c,hist,edges,rmm,idx] = rainflow(L);

T = array2table(c,'VariableNames',{'Count','Range','Mean','Start','End'})

S=goodman(c(:,2),c(:,3),235);

D=damage(S,1)