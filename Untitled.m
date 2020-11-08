z=[-5];
p=[0,-1,-3,-12];
k=[1]

G=zpk(z,p,k);
rlocus(G)
[k,poles]=rlocfind(G)


