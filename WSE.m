function res=WSE(signal,Fs)

if mod(length(signal),2)%����ż��
    signal(end)=[];
end

[pxx,f]=pwelch(signal,[],[],[],Fs);
plot(f,pow2db(pxx));


end