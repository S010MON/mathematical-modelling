% Ex 1 - Exponential Population Growth
e = 1;
x_0 = 2;
Y = [];

t_step = 0.1;
t_final = 10;

for t = 0:t_step:t_final
	y_t = expGrowth(x_0, t, e);
	Y = [Y, y_t];
end%for

plot(0:t_step:t_final, Y);



% Ex 2 - Limited Population Growth
epsilon = 0.5;
sigma = 0.01;
x_t = 2;
Y = [];

t_final = 10;

for t = 0:t_final
	x_t = restrictedGrowth(x_t, epsilon, sigma);
	Y = [Y, x_t];
end%for

figure();
plot(0:t_final, Y);
