% ����������--->��ȡ���岨��(ͬʱȥ�������ظ�)
% �Աຯ��
% ��һ���裺���ǵ�һ������
% ��һ���裺�غ����̵���
% R=findPV(X,P)
% X���غ�����
% P���Ƿ��ͼ
% R�����
%
% �㷨��
% �غ����У�V=[v1,v2,��,vn]  ����vi,i��[1,2,��,N]��
% 1.����V��һ�ײ������ Diffv(i)=V(i+1)?V(i),����i��1,2,��,N?1
% 2.�Բ����������ȡ���ź������㣬Trend=sign(Diffv),������Diffv����Diffv(i)����0����ȡ1�����С��0����ȡ-1��������ֵΪ0��
% 3.��β������Trend����,�������²�����if Trend(i)=0��Trend(i+1)��0����Trend(i)=1if Trend(i)=0��Trend(i+1)<0����Trend(i)=?1
% 4.��Trend��������һ�ײ�����㣬�õ�R=diff(Trend)��
% 5.�����õ��Ĳ������R�����R(i)=?2����i+1ΪͶӰ����V��һ����ֵλ����Ӧ�ķ�ֵΪV(i+1)�����R(i)=2����i+1ΪͶӰ����V��һ������λ����Ӧ�Ĳ���ΪV(i+1)��

function R=findPV(X,P)
copy1=X(1:end-1);% data�Ŀ���1
copy2=X(2:end);% data�Ŀ���2

% Step1.��һ�β������
dif1=copy2-copy1;

% Step2.ȡ��������
dif1(dif1>0)=1;
dif1(dif1<0)=-1;

% Step3.�������ȡ��������
temp=dif1;
copy3=dif1(1:end-1);
copy4=dif1(2:end);
temp(copy3==0 & copy4>=0)=1;
temp(copy3==0 & copy4<0)=-1;

% Step4.�ڶ��β��
copy5=temp(1:end-1);
copy6=temp(2:end);
dif2=copy6-copy5;

% Step5.��β����
a=X(1);b=X(2);c=X(end-1);d=X(end);
dif2=[b-a,dif2,c-d];

% Step6.ȡ��������
dif2(dif2>0)=1;dif2(dif2<0)=-1;dif2(dif2==0)=0;
dif2=-dif2;% �෴�� ��Ҫ

% Step7.����
PV=dif2;% ��ȱ�ʶ 1:�� -1:�� 0:��
R=X(PV~=0);% ��ȡ�����ķ���غ�ֵ


% �Ƿ��ͼ
if P==1
hold on;
plot(1:length(X),X,'b-');
stem(1:length(dif2),abs(PV).*X,'ro');
title('find peak & vally ');xlabel('sequence');ylabel('load');
%legend('load','pv');
end

end