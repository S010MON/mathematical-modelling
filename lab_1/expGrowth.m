function x_prime = expGrowth(x_0, t, epsilon)
%% A model of unrestricted exponential growth of a population where:
% x_0 = start population
% t = current time
% epsilon = growth factor

        x_prime = exp(epsilon * t) * x_0;

end%function

