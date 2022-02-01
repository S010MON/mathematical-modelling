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

% Comment in for plot!
%plot(0:t_step:t_final, Y);



% Ex 2 - Limited Population Growth
epsilon = 10;
sigma = 0.1;
x_t = 0.1;
Y = [];

t_final = 10;

for t = 0:t_final
	x_t = x_t + restrictedGrowth(x_t, epsilon, sigma);
	Y = [Y, x_t];
end%for

Y

figure();
plot(0:t_final, Y);


% Ex 3 - Competing Species
e_1 = 0;
s_1 = 0;
a_1 = 0;
x_t = 10;

e_2 = 0;
s_2 = 0;
a_2 = 0;
y_t = 11;






