function res=PMInter(a,b)
%���������������׵���ξأ�ʹ���������֣��ٶȺ���������
syms w;
Hs=1.8;%���岨��
T1=2.5;%������������
A=173*Hs^2/(T1^4);
B=691/(T1^4);

S(w)=(A/w^5)*exp(-B/w^4);%

res=int(S,w,a,b);
res=vpa(res,4);
end


