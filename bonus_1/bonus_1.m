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

