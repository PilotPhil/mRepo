function index=findEqualPoint(W0,W,S,P)
%%�ҵ���������ȷֵ�index%%
%%���룺Ƶ����W0����������Ƶ������W ������S���Ƿ��ͼP��0��1
%%������ȷֵ�Ƶ��ֵ
hold on;
step=W(2)-W(1);%Ƶ���Ჽ��
pl=(W(1)-W0(1))/step;%
pr=(W0(end)-W(end))/step;%
pl=int32(pl);%ת��Ϊ����
pr=int32(pr);

% �������ҽ��л���
Aera_L=0;
for i=1:length(W)
    Y=S(1+pl:i+pl);
    A=trapz(Y);
    Aera_L(i)=A*step;%���������������
end

% ����������л���
Aera_R=0;
for i=1:length(W)
    Y=S(length(W0)-i-pr+1:length(W0)-pr);
    A=trapz(Y);
    Aera_R(length(W)-i+1)=A*step;%���������������
end

for i=1:length(W)
    error(i)=abs(Aera_L(i)-Aera_R(i));%�����ֵ
end

[value,id]=min(error);%�ҵ������ֵ��Сֵ��������

index=step*id+W(1);
fprintf('������㣺%.4f\n�������%.4f\n��������С��%.4f\n',index,Aera_L(id),value);


if P==1%�Ƿ�Ҫ��ͼ
    plot(W,Aera_L,'r.-',W,Aera_R,'b.-',W,error,'K.-');
    stem(index,Aera_L(id));
    legend('�����������','�����������','�����ֵ','�������');
    xlabel('\omega [rad/s]');
    ylabel('E [m^2 s \omega]');
    title('����ȷֵ����');
end

end