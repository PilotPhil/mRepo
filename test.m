% 导入数据
data=load('data5.txt');
subplot(4,1,1)
plot(1:length(data),data,'b')
title('原来时域')

subplot(4,1,2)
FTTA(data,10);
title('原来频域')

% 滤波
R=filter(fff,data)

subplot(4,1,3)
plot(1:length(R),R,'b')
title("滤波后时域")

subplot(4,1,4)
FTTA(R,10);
title("滤波后频域")