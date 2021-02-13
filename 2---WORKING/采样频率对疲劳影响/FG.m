function res=CD(R)

% Step2.����������
hold on;
count=rainflow(R);
count(:,2)=count(:,2).*count(:,1);
count(:,3)=count(:,3).*count(:,1);
count(:,1)=1;
T = array2table(count,'VariableNames',{'Count','Range','Mean','Start','End'});

Sa=count(:,2);%��ֵ
Sm=count(:,3);%��ֵ

% Step3.GoodManƽ��Ӧ������
Su=235;
MS=2*(Su.*Sa)./(Su-Sm);%Ӧ����Χ
start=ceil(min(MS));
stop=ceil(max(MS));

% Step4.ͳ��Ӧ����Χ��Ӧ��Ӧ��ѭ������
sRange=start:2:stop;
for i=1:length(sRange)-1
    cycle(i)=length(MS(MS>sRange(i) & MS<sRange(i+1)));
end


bar(sRange(1:end-1),cycle,'b');
plot(sRange(1:end-1),cycle,'rx-');
xlabel('Ӧ����ΧS (N/mm^2)');ylabel('Ӧ��ѭ������');

% Step5.���˶ȼ���
Nmax=log10(5.8e12)-3*log10(MS);
Nmax=10.^Nmax;

damage=MS./Nmax;
res=sum(damage);
fprintf("���˶ȣ�%.10f%%\n",100*res);

end
