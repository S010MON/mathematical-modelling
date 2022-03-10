%% Bonus 2 MM 2021/2022 template
%  Don't put personal information here. It will be send for a plagiarism 
% check offsite 

%% Challenge 1a
% Given that a signal is sampled at 300Hz, design a notch filter to cancel
% out the 60Hz powerline interference and another notch filter to cancel 
% its 120Hz harmonic. Combine these in a single transfer function
fs=300;

% first make notch filter for 60Hz powerline
z1 = [pi * 120i, pi * -120i];
p1 = [-0.1 + pi * 120i, -0.1 - pi * 120i];
b1 = [1, 14400 * pi^2];
a1 = [1, 0.2, 0.1 - pi^2 * 14400.001];

% then make notch filter for 120Hz harmonic
z2 = [pi * 240i, pi * -240i];
p2 = [-0.1 + pi * 240i, -0.1 - pi * 240i];
b2 = [1, 14400 * pi^2];
a2 = [1, 0.2, 0.1 - pi^2 * 14400.001];

% Finally combine the notch filters in a single transfer function
z_c % zeros of combined transfer function
p_c % poles of combined transfer function
b_c % numerator of combined transfer function
a_c % denominator polynomial of combined transfer function
sys1 % Transfer function of combined system

%% Challenge 1b
% Plot the magnitude response (bode magnitude plot)
% first compute the frequency response
omega = linspace(0,2*pi,1000); % frequencies in radians
H2 %frequency response
% Plot the magnitude response (absolute value of the frequency response)
figure(4);
% ==> your code here
xlabel('frequency (Hz)');
title('Magnitude response Task 2b')

% Make a pole-zero plot
figure;
% plot unit circle
tmpx = real(exp(omega*1i));
tmpy = imag(exp(omega*1i));
plot(tmpx,tmpy,'--k');
% plot real axis
hold on
plot(linspace(-1.1,1.1,100),zeros(1,100),'k:');
% plot imaginary axis
plot(zeros(1,100),linspace(-1.1,1.1,100),'k:');
% plot poles with an x
% plot zeros with an o
xlabel('real axis')
ylabel('imaginary axis')
axis square
title('Pole-zero plot Challenge 1b')

%% Challenge 1c
figure;
subplot(3,1,1)
% do some plotting
title ('Time domain inout');
xlabel('time (s)') % also make sure you actually have seconds that you show 
subplot(3,1,2)
plot((0:length(u)-1)*(fs/length(u)),abs(fft(u))); % magnitude spectrum
title('Magnitude spectrum input');
xlabel('write the meaning and units here')
subplot(3,1,3)
% todo: add the phase spectum
title('Phase spectrum input');
xlabel('write the meaning and units here')
ylabel('write the meaning and units here')

%% Challenge 1d
figure;
plot((0:length(u)-1)*(fs/length(u)),abs(fft(u))); % magnitude spectrum input
hold on
% todo: magnitude spectrum output
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

%% Challenge 2b
