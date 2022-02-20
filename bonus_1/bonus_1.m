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
f = @(x,y) [2 - 3*y, 2*y - 3*x; y + 1, x + 1]; % This is the result above manually inputted
A = f(1,2)


%% Challenge 2
% Part (a): Construct a second-order continuous-time state-space representation based on the information provided

r = 120;
l = 0.01;
c = 0.002;
v_1 = 1;

A = [ (-1/(l*c)), 0;
     -0, (-r*c/(l*c))];
B = [1/(l*c);
     0];
C = [1, 0];
D = 0;

RCL_ss = ss(A,B,C,D)

RCL_tf = tf(RCL_ss)


