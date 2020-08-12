function res=weibull(n,k)
%%Weibull distribution
hold on;

n;%�߶Ȳ���scale para
k;%��״����shape para
% pd=makedist('weibull','a',n,'b',k)%ʹ��ָ���Ĳ���ֵ����һ�����ʷֲ�����

x=0:0.01:5;
f=pdf('weibull',x,n,k);%�����ܶȺ���Probability density function
F=cdf('weibull',x,n,k);%�ۼƷֲ�����Cumulative Distribution Function

plot(x,f,'b-')
plot(x,F,'r-')
title('�����ܶ����ۼƷֲ�����');legend('pdf','cdf');
xlabel('�������');ylabel('����');
end