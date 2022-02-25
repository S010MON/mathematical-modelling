
fs=100; % sampling frequency
t=0:1/fs:5; % time vector
s1=randn(size(t)) + sin(2*pi*15*t); %signal
S1=fft(s1); % Fourier transform
omega=linspace(0,fs,length(t)+1);omega(end)=[]; % generate vector of frequencies
%figure;plot(omega,abs(S1)); % plot Fourier magnitude spectrum


%% Part B:
lpf = tf([2 * pi * 50], [1, 2 * pi * 50])
pole(lpf)
zero(lpf)

ltiview(lpf)

%% Part C:

% Simulate the low pass filter
Y_t = lsim(lpf, s1, t)
% Time ->  Freq
Y_f = fft(Y_t)

figure(1)
plot(omega, abs(S1))
hold on;
plot(omega, abs(Y_f))

%% Part C
lpf2