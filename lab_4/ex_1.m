
%% Question 1
A = [  4,  1,  0;
      -7, -1, -1;
     119, 32, -8 ]

B = [0, 0, -1]'

C = [227, 55, -13]

D = -2

% Part A:
sys1 = ss(A,B,C,D)
sys1_tf = tf(sys1)
pole(sys1)
isstable(sys1_tf)


% Part B:
f = @(x) sin(4*x);
T = 0:0.01:8;
U = f(T);
Y = lsim(sys1, U, T);

figure(1);
plot(T,U);
hold on
plot(T, Y);
hold off;


%Part C:
K = 1.6;
phi = -1.4;
g = @(x) K * sin(4*x + phi);

figure(2);
plot(T, Y);
hold on;
plot(T, g(T));
hold off;

%Part D:
shift = evalfr(sys1, 4i)
K_hat = abs(shift)
phi_hat = angle(shift)