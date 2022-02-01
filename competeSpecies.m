function [x_prime, y_prime] = competeSpecies(epsilon_1,	sigma_1, alpha_1, x_t,
       					epsilon_2, sigma_2, alpha_2, y_t)

%% A model of two species competing for the same resource where:
% epsilon = growth factor
% sigma = restriction on population
% alpha = effect on the opposite species
% x_t and y_t = population of species x and y at time t respectively

	x_prime = (epsilon_1 - (sigma_1 * x_t) - (alpha_1 * y_t)) * x_t;
	y_prime = (epsilon_2 - (sigma_2 * y_t) - (alpha_2 * y_t)) * y_t;

end%function
