function index=equalParts(basic,start,stop,plm)
%�������ָ�����---���η�---������ӿ��ٶ�%%
%���룺band---������Ƶ�Σ��ܵı��ָ�����䣩
%           S---����
%           step---Ƶ���Ჽ��
%           start stop---��ʵ���ָ�����
%������ָ��Ƶ������
band=basic.band;
S=basic.S;
step=basic.step;

temp1=(start-band(1))/step+1;
temp1=int32(temp1);

temp2=(stop-band(1))/step+1;
temp2=int32(temp2);

%�������һ���
AL=[];
id=1;
for i=temp1:temp2
    Y1=S(temp1:i);
    AL(id)=trapz(Y1)*step;
    id=id+1;
end

%�����������
AR=[];
id=1;
for i=temp2:-1:temp1
    Y2=S(i:temp2);
    AR(id)=trapz(Y2)*step;
    id=id+1;
end
AR=flip(AR);%������

ER=[];
for i=1:length(AL)
    ER(i)=abs(AL(i)-AR(i));
end

[value,where]=min(ER);
index=(where-1)*step+start;

if plm==1%�Ƿ�Ҫ��ͼ
    hold on;
    W=start:step:stop;
    plot(W,AL,'b-',W,AR,'b-',W,ER,'r-');
    stem(index,AL(where),'ko');
    legend('�����������','�����������','�����ֵ','�������');
    xlabel('\omega [rad/s]');
    ylabel('E [m^2 s \omega]');
    title('����ȷֵ����');
end

end
