function Area=aeraOfPM(basic,start,stop)
%������׾���⣨���η���
%���룺band---������Ƶ�Σ��ܵ����䣩
%           S---����
%           step---Ƶ���Ჽ��
%           start stop---��ʵ��������

band=basic.band;
S=basic.S;
step=basic.step;

temp1=(start-band(1))/step+1;
temp1=int32(temp1);

temp2=(stop-band(1))/step+1;
temp2=int32(temp2);

Y=S(temp1:temp2);
Area=trapz(Y)*step;
end