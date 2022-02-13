function [x_prime, y_prime] = predPrey(x_t, y_t, e_1, a_1, e_2, a_2)

	x_prime = (e_1 * x_t) - (a_1 * x_t * y_t);
	y_prime = (-e_2 * y_t) + (a_2 * x_t * y_t);

end%function
