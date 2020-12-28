clc;clear all;

% Step1. [0,1]��������������ؿ��巨�õ��غ�ֵ
p=rand(1e4,1);%��������
n=6.02;%�߶Ȳ���scale para
k=0.98;%��״����shape para
L=icdf('weibull',p,n,k);%�غ�ֵ �ۻ��ֲ��������溯��
L=findPV(L',0);
L=seqadj(L);
L=L';

figure(2); 
subplot(3,2,1);plot(1:length(L),L,'b-');title('δ���������غ�ʱ������');ylabel('�غ�ֵ');
subplot(3,2,2);FTTA(L,100);

% Step E.��������
t=(0:length(L)-1)*0.01;
Ln=L+25*sin(50*t');
subplot(3,2,3);plot(1:length(Ln),Ln,'b-');title('����������غ�ʱ������');ylabel('�غ�ֵ');
subplot(3,2,4);FTTA(Ln,100);

% Step E.2 �˲�
R=filter(bp,Ln);%
subplot(3,2,5);plot(1:length(R),R,'b-');title('�˲�����غ�ʱ������');ylabel('�غ�ֵ');
subplot(3,2,6);FTTA(R,100);

figure(3);A=CD(L);
figure(4);B=CD(Ln);
figure(5);C=CD(R);

er=(A-C)/A;
fprintf("���˶���%.5f%%\n",er*100);























% % Step E.3 ������
% er=R-L;

% % Step2.����������
% count=rainflow(R);
% count(:,2)=count(:,2).*count(:,1);
% count(:,3)=count(:,3).*count(:,1);
% count(:,1)=1;
% T = array2table(count,'VariableNames',{'Count','Range','Mean','Start','End'});
% 
% Sa=count(:,2);%��ֵ
% Sm=count(:,3);%��ֵ
% 
% % Step3.GoodManƽ��Ӧ������
% Su=235;
% MS=(Su.*Sa)./(Su-Sm);%Ӧ����Χ
% start=ceil(min(MS));
% stop=ceil(max(MS));
% 
% % Step4.ͳ��Ӧ����Χ��Ӧ��Ӧ��ѭ������
% sRange=start:2:stop;
% for i=1:length(sRange)-1
%     cycle(i)=length(MS(MS>sRange(i) & MS<sRange(i+1)));
% end
% 
% figure(3);hold on;
% bar(sRange(1:end-1),cycle,'b');
% plot(sRange(1:end-1),cycle,'rx-');
% xlabel('Ӧ����ΧS (N/mm^2)');ylabel('Ӧ��ѭ������');
% 
% % Step5.���˶ȼ���
% Nmax=log10(5.8e12)-3*log10(MS);
% Nmax=10.^Nmax;
% 
% damage=MS./Nmax;
% life=sum(damage);
% fprintf("���˶ȣ�%.10f%%",100*life);


