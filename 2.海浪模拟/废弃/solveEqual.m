function Res=solveEqual(start,stop)
%������������������ָ�㣬ʹ���������֣��ٶȺ���������
syms x;

left=PMInter(start,x);
right=PMInter(x,stop);

F(x)=abs(left-right);

temp=solve(F(x)==0);

for i=1:length(temp)
    if temp(i)>start && temp(i)<stop
        Res=temp(i);
    end
end

Res=vpa(Res,5);

end











