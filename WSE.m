function res=WSE(signal,Fs)

if mod(length(signal),2)%Èô·ÇÅ¼Êý
    signal(end)=[];
end

[pxx,f]=pwelch(signal,[],[],[],Fs);
plot(f,pow2db(pxx));


end