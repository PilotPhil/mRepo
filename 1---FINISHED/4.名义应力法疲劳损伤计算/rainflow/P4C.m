% ����������--->�ĵ�����ж�
% �Աຯ��
% [flag Me Ra]=P4C(a,b,c,d)
% a    ���غɵ�1
% Me ����ֵ
% Ra  ����ֵ
% flag���Ƿ񹹳�ѭ��
%
% �㷨��
% 1.�غɵ�a,b,c,d
% 2.��̣�S1=|a-b|,S2=|b-c|,S3=|c-d|
% 3.����������S1>=S2��S2<=S3ʱ
% 4.��ȡ��ֵ��0.5*(b+c)  ��ֵ��|b-c|

function [flag Me Ra]=P4C(a,b,c,d)
  S1=abs(a-b);
  S2=abs(b-c);
  S3=abs(c-d);
  
  if S1>=S2 && S2<=S3
    flag=1;
    Me=0.5*(b+c);% ��ֵ
    Ra=0.5*abs(b-c);% ��ֵ
  else
    flag=0;Me=0;Ra=0;
  end
  
end