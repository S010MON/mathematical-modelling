x_dot = @(x,y) 2*x - 3 * x * y + y^2;
y_dot = @(x,y) x + y + x * y - 5;

%% Challenge 1
% Part (a): Which of the following three points are equilibrium points?
a = [x_dot(0,0), y_dot(0,0)]
b = [x_dot(1,2), y_dot(1,2)]
c = [x_dot(2,1), y_dot(2,1)]

% point b is shown to have an equilibirum (x_0,y_0) = (1,2) 

% Part (b): 
syms x y;
J = jacobian([2*x - 3 * x * y + y^2, x + y + x * y - 5] ,[x,y]);
f = @(x,y) [2 - 3*y, 2*y - 3*x; y + 1, x + 1]; % This is the result from above manually inputted
A = f(1,2)


%% Challenge 2
% Part (a): Construct a second-order continuous-time state-space representation based on the information provided

r = 120;
l = 0.01;
c = 0.002;

A = [      0    ,    1    ;
      (-1/(l*c)), (-r/l) ];
B = [    0    ;
      1/(l*c)];
C = [1, 0];
D = 0;

RCL_ss = ss(A,B,C,D)


% Part (b): Simulate the state-space system for 10 second
T = 0:0.001:2;              % only 2 seconds to keep it small
U = sin(50 * 2 * pi * T);
Y = lsim(RCL_ss, U, T);

%plot(T, Y);


% Part (c): Is this system stable or not?
% Yes as it tends towards an equilibrium around 0

%% Challenge 3
% Use the Matlab “residue” command to perform partial fraction expansion on the following
% discrete-time transfer function

b = [1, 1, 1/4];
a = [1, 1/4, 0];
[r,p,k] = residuez(b, a)


b = [1, 1, 1/4];
a = [1, 1/4, 0, 0];

[r, p, k] = residue(b, a)

% The partial fraction expansion found is:
%            0.5000              0.5000 
% H(z) = ---------------- + ----------------
%          z + 0.5000i          z - 0.5000i







