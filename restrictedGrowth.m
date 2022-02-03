function x_prime = restrictedGrowth(x_t, epsilon, sigma)
%% A model of restricted growth of a population where:
% x_0 = start population
% t = current time
% epsilon = growth factor
% sigma = restriction on population

	x_prime = (epsilon - (sigma * x_t)) * x_t; 

end%function	
