%% Bonus 2 MM 2021/2022 template
%  Don't put personal information here. It will be send for a plagiarism 
% check offsite 

clc
clear;

%% Challenge 1a
% Given that a signal is sampled at 300Hz, design a notch filter to cancel
% out the 60Hz powerline interference and another notch filter to cancel 
% its 120Hz harmonic. Combine these in a single transfer function
fs=300;
options = bodeoptions;
options.FreqUnits = 'Hz';


% first make notch filter for 60Hz powerline
freq1 = 120 * pi/fs
z1 = [cos(120 * pi/fs) + (sin(120 * pi/fs) * 1i), cos(120 * pi/fs) - (sin(120 * pi/fs) * 1i)];
p1 = [0.95 * (cos(freq1) + sin(freq1) * 1i), 0.95 * (cos(freq1) - sin(freq1) * 1i)];
b1 = poly(z1)
a1 = poly(p1)
sys_1 = tf(b1, a1, 1/fs)

% then make notch filter for 120Hz harmonic
z2 = [cos(240 * pi/fs) + (sin(240 * pi/fs) * 1i), cos(240 * pi/fs) - (sin(240 * pi/fs) * 1i)];
p2 = [0.95 * (cos(240 * pi/fs) + sin(240 * pi/fs) * 1i), 0.95 * (cos(240 * pi/fs) - sin(240 * pi/fs) * 1i)];
b2 = poly(z2);
a2 = poly(p2);
sys_2 = tf(b2, a2, 1/fs)

% figure(1);
% bode(sys_1, options), grid
% hold on;
% bode(sys_2, options), grid
% hold off;

% Finally combine the notch filters in a single transfer function
z_c = [z1, z2]
p_c = [p1, p2]
b_c = poly(z_c)
a_c = poly(p_c)

%% Challenge 1b
% Plot the magnitude response (bode magnitude plot)
% first compute the frequency response
omega = linspace(0,2*pi,1000);     % frequencies in radians
H1 = tf(b_c, a_c, 1/fs)

% Plot the magnitude response (absolute value of the frequency response)
figure(2);
bode(H1, options), grid
title('Magnitude response Task 1b')

% Make a pole-zero plot
figure(3);
% plot unit circle
tmpx = real(exp(omega*1i));
tmpy = imag(exp(omega*1i));
plot(tmpx,tmpy,'--k');
% plot real axis
hold on
plot(linspace(-1.1,1.1,100),zeros(1,100),'k:'); % plot imaginary axis
plot(zeros(1,100),linspace(-1.1,1.1,100),'k:');
plot(real(p_c), imag(p_c),'x');        % plot poles with an x
plot(real(z_c), imag(z_c), 'o');        % plot zeros with an o

xlabel('real axis')
ylabel('imaginary axis')
axis square
title('Pole-zero plot Challenge 1b')

% Challenge 1c

data = load("data_MM_bonus2_challenge1.mat");
u = data.u;

figure(4);
subplot(3,1,1)
plot(1:length(u), u)
title ('Time domain input');
xlabel('time (s)') % also make sure you actually have seconds that you show 

subplot(3,1,2)
plot((0:length(u)-1)*(fs/length(u)),abs(fft(u))); % magnitude spectrum
title('Magnitude spectrum input');
xlabel('frequency (Hz)')

subplot(3,1,3)
plot((0:length(u)-1)*(fs/length(u)),angle(fft(u))); % magnitude spectrum
title('Phase spectrum input');
xlabel('frequency (Hz)')
ylabel('angle (radians)')

%% Challenge 1d
figure(5);
plot((0:length(u)-1)*(fs/length(u)),abs(fft(u))); % magnitude spectrum input
hold on
t = linspace(0, 1000, 1/fs);
y_t = lsim(H1, u, t);
Y_t = fft(y_t);
plot((0:length(u)-1)*(fs/length(u)),abs(Y_t));
title('Magnitude spectrum');
xlabel('write the meaning and units here')

%% Challenge 2
T=0.01; % sampling interval
A=[-1 2 -3;-2 0 -1;2 1 -1]; % System matrix
B=[1; 0; -2]; % input matrix
C=[0 0 2]; % output matrix
D=0; % direct feedthrough

t=0:T:5-T; %create time vector
u=linspace(-1,1,length(t))+sin(2*t); % sampled time series

%% Challenge 2a
sys = ss(A, B, C, D);
M = [A, B; zeros(1,3), 0];
sys_d = expm(M*T);
phi = sys_d([1,2,3,], [1,2,3])
gamma = sys_d([1,2,3], 4)

%% Challenge 2b
[y1, ty1, s1] = lsim(sys, u, t,'zoh');
sys = ss(phi, gamma, C, D, T);
[y2, ty2, s2] = lsim(sys, u ,t ,'zoh');

figure(6);
hold on
plot(t, y1, 'b')
plot(t, y2, 'c--')
plot(t, s1(:,1), 'ro')
plot(t, s1(:,2), 'r*')
plot(t, s1(:,3), 'r^')
plot(t, s2(:,1), 'go')
plot(t, s2(:,2), 'g*')
plot(t, s2(:,3), 'g^')

lgd = legend( ...
    'continuous output', ...
    'discrete output', ...
    'continuous states a', ...
    'continuous states b', ...
    'continuous states c', ...
    'discrete states a', ...
    'discrete states b', ...
    'discrete states c');
lgd.Title.String = 'Legend';
lgd.Position = [0.2 0.2 0.1 0.2];
title('Continuous and Discrete System Simulation 2b')