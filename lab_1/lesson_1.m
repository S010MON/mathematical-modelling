
% global simulation params
t_step = 0.1;
t_final = 10;
T = 0 : t_step : t_final;

%% Ex 1 - Exponential Population Growth
e = 0.3;
x_0 = 2;
x_t = 2;
Y = [];

for t = 0:t_step:t_final
	x_t = x_t + expGrowth(x_0, t, e);
	Y = [Y, x_t];
end%for

% Comment in for plot!
f_1 = figure(1)
plot(T, Y)
title('Exponential population growth')
xlabel('Time')
ylabel('Population Size')


%% Ex 2 - Limited Population Growth
epsilon = 0.3;
sigma = 0.01;
x_t = 1;
Y = [];

for t = 0:t_step:t_final
	x_t = x_t + restrictedGrowth(x_t, epsilon, sigma);
	Y = [Y, x_t];
end%for

f_2 = figure(2)
plot(T, Y)
title('Quadratic population growth limited by resources')
xlabel('Time')
ylabel('Population Size')


%% Ex 3 - Competing Species
e_1 = 0.2;
s_1 = 0.01;	% Parameters for species x
a_1 = 0.03;
x_t = 1;

e_2 = 0.1;
s_2 = 0.01;	% parameters for species y
a_2 = 0.01;
y_t = 10;

Y = [];		% Output array of x
X = []; 	% Output array of y

for t = 0:t_step:t_final
	[dx, dy] = competeSpecies(e_1, s_1, a_1, x_t, e_2, s_2, a_2, y_t); 
	x_t = x_t + dx;
	y_t = y_t + dy;
	X = [X, x_t];
	Y = [Y, y_t];
end%for

f_3 = figure(3)
plot(T, X)
hold on
plot(T, Y)
hold off
title('Interaction of two species competing for the same resources')
xlabel('Time')
ylabel('Population Size')

%% Ex 4 - Predator Prey
e_1 = 0.04;
a_1 = 0.0005;
e_2 = 0.3;
a_2 = 0.001;
x_t = 50;
y_t = 5;

Y = [];
X = [];

for t = 0:t_step:t_final
	[dx, dy] = predPrey(x_t, y_t, e_1, a_1, e_2, a_2);
	x_t = x_t + dx;
	y_t = y_t + dy;
	X = [X, x_t];
	Y = [Y, y_t];
end%for

f_4 = figure(4)
plot(T, X)
hold on
plot(T, Y)
hold off
title('Lokta-Volterra Predator Prey Model')
xlabel('Time')
ylabel('Population')

