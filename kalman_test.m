t = (-2:0.001:3)'*5;
n = randn(size(t)); % ����
signal = sin(t);         % �ź�
signal_noise = signal + n;          % �����ź�
R = cov(n);         % �������Э����

% ��1��Ԥ�����Ƚϴ��ʱ��
Q = 10^-7; % Ԥ�����
res = KalmanFilter(signla_noise,Q,R);
e = signal - res; % ���

hold on;
plot(t,signal_noise,'g',t,signal,'b',t,res,'r');
legend('�������ź�','���ź�','�˲���');


function res=KalmanFilter(data,Q,R)
    %----------------------------------------------
    % res=kalmanFilter(data,Q,R)
    % data:�ɼ��������ݵ�
    % Q   :״̬���Э�������---�޷���ȷ��ģ���������
    % R   :�۲����Э�������---�����������
    %----------------------------------------------

    % 1.������
    T=1; % �������1s
    A=[1 T;0 1]; %
    B=[0]; %
    H=[1 0]; %
    Q; % ״̬���Э�����
    R; % �۲����Э�����

    % 2.��ʼֵ
    N=length(data);
    Xu = [data(1); 0];
    Pu = [0 0;0 0];
    res  = zeros(N,1);

    % 3.����
    for i = 2:N
        Xp = A * Xu;
        Pp = A * Pu * A' + Q;
        K  = Pp * H' * ( H * Pp * H' + R)^-1;
        Xu = Xp - K * H * Xp + K * data(i);
        Pu = Pp - K * H * Pp;
        
        res(i) = Xu(1);
    end
end










