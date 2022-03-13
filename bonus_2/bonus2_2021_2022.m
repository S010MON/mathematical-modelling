%% Bonus 2 MM 2021/2022 template
%  Don't put personal information here. It will be send for a plagiarism 
% check offsite 

%% Challenge 1a
% Given that a signal is sampled at 300Hz, design a notch filter to cancel
% out the 60Hz powerline interference and another notch filter to cancel 
% its 120Hz harmonic. Combine these in a single transfer function
fs=300;
t = 0: 1/fs :5;

% first make notch filter for 60Hz powerline
z1 = [pi * 120i, pi * -120i];
p1 = [-0.1 + pi * 120i, -0.1 - pi * 120i];
b1 = [1, 0, 14400 * pi^2];
a1 = [1, 0.2, 0.1 + 14400 * pi^2];
sys_1 = tf(b1, a1)

% then make notch filter for 120Hz harmonic
z2 = [pi * 240i, pi * -240i];
p2 = [-0.1 + pi * 240i, -0.1 - pi * 240i];
b2 = [1, 0, 57600 * pi^2];
a2 = [1, 0.2, 0.1 + 57600 * pi^2];
sys_2 = tf(b2, a2)

% figure;
% bode(sys_1)
% hold on;
% bode(sys_2)
% hold off;

% Finally combine the notch filters in a single transfer function
z_c = [z1, z2]
p_c = [p1, p2]
% b_c = [1, 0, 72000 * pi^2, 0, 829440000 * pi^4];
b_c = [1, 0, 710600, 0, 80790000000];
% a_c = [1, 0.4, 0.2 + pi^2 * 72000i, 0.04 + pi^2 * 14400i, 829440000.01 + pi^2 * 7200i];
a_c = [1, 0.4, 710600i, 142100i, 80800000000];


%% Challenge 1b
% Plot the magnitude response (bode magnitude plot)
% first compute the frequency response
omega = linspace(0,2*pi,1000);     % frequencies in radians
signal = @(w) sin(t * w);
H1 = tf(b_c, a_c)

% Plot the magnitude response (absolute value of the frequency response)
figure(4);
bode(H1)
title('Magnitude response Task 1b')

% Make a pole-zero plot
figure;
% plot unit circle
tmpx = real(exp(omega*1i));
tmpy = imag(exp(omega*1i));
plot(tmpx,tmpy,'--k');
% plot real axis
hold on
plot(linspace(-1.1,1.1,100),zeros(1,100),'k:'); % plot imaginary axis
plot(zeros(1,100),linspace(-1.1,1.1,100),'k:');

zero_real = cos(real(z_c));
zero_imag = sin(imag(z_c));
pole_real = cos(real(p_c));
pole_imag = sin(imag(p_c));
plot(pole_imag, pole_real,'x');        % plot poles with an x
plot(zero_imag, zero_real,'o');        % plot zeros with an o

xlabel('real axis')
ylabel('imaginary axis')
axis square
title('Pole-zero plot Challenge 1b')

%% Challenge 1c

data = load("data_MM_bonus2_challenge1.mat");
u = data.u;

figure;
subplot(3,1,1)
plot(1:length(u), u)
title ('Time domain input');
xlabel('time (s)') % also make sure you actually have seconds that you show 

subplot(3,1,2)
plot((0:length(u)-1)*(fs/length(u)),abs(fft(u))); % magnitude spectrum
title('Magnitude spectrum input');
xlabel('write the meaning and units here')

subplot(3,1,3)
U = abs(fft(u));
plot(omega, U);
title('Phase spectrum input');
xlabel('write the meaning and units here')
ylabel('write the meaning and units here')



% %% Challenge 1d
% figure;
% plot((0:length(u)-1)*(fs/length(u)),abs(fft(u))); % magnitude spectrum input
% hold on
% % todo: magnitude spectrum output
% title('Magnitude spectrum');
% xlabel('write the meaning and units here')
% 
% %% Challenge 2
% T=0.01; % sampling interval
% A=[-1 2 -3;-2 0 -1;2 1 -1]; % System matrix
% B=[1; 0; -2]; % input matrix
% C=[0 0 2]; % output matrix
% D=0; % direct feedthrough
% 
% t=0:T:5-T; %create time vector
% u=linspace(-1,1,length(t))+sin(2*t); % sampled time series
% 
% %% Challenge 2a
% 
% %% Challenge 2b

