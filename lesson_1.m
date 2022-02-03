% Ex 1 - Exponential Population Growth
e = 0.3;
x_0 = 2;
Y = [];

t_step = 0.1;
t_final = 10;

for t = 0:t_step:t_final
	y_t = y_t + expGrowth(x_0, t, e);
	Y = [Y, y_t];
end%for

% Comment in for plot!
figure(1)
plot(0:t_step:t_final, Y);



% Ex 2 - Limited Population Growth
epsilon = 0.3;
sigma = 0.01;
x_t = 1;
Y = [];

t_step = 0.1;
t_final = 10;

for t = 0:t_step:t_final
	x_t = x_t + restrictedGrowth(x_t, epsilon, sigma);
	Y = [Y, x_t];
end%for

figure(2);
plot(0:t_step:t_final, Y);

% Ex 3 - Competing Species
e_1 = 0;
s_1 = 0;
a_1 = 0;
x_t = 10;

e_2 = 0;
s_2 = 0;
a_2 = 0;
y_t = 11;






