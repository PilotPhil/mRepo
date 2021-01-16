% 传动比计算
% 2021-1-16
% @Pilot-Phil
% https://github.com/PilotPhil?tab=repositories

front=[24,32,34,42];% 牙盘
after=[11,13,16,20,24,28,34,40];% 飞轮

hold on;

for i=front
    ratio=i./after;
    plot(after,ratio,'-*');
end