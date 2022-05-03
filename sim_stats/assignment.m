clc;
clear;
data = load("dataIndSSA2022.mat");
d1 = data.task1_data;

%% Mean, Variance, and Sample 
fprintf('\nTask 1\n\n'); 
n = length(d1);
d1_mean = mean(d1);
fprintf('There are %d datapoints in the data set\n', n); 
fprintf('Minimum value: %f\n', min(d1)); 
fprintf('Maximum value: %f\n', max(d1));
fprintf('Mean value   : %f\n\n', d1_mean);

d1_sigma2 = sum((d1 - d1_mean).^2)/n-1;
fprintf('The variance is: %f\n\n', d1_sigma2);
d1_sigma = sqrt(d1_sigma2);
fprintf('The standard deviation is: %f\n\n', d1_sigma);

%% 7 Number Summary
fprintf('2nd percentile  : %f\n', prctile(d1, 2)); 
fprintf('9th percentile  : %f\n', prctile(d1, 9)); 
fprintf('1st quartile    : %f\n', prctile(d1, 25)); 
fprintf('median value    : %f\n', median(d1));
fprintf('3rd quartile    : %f\n', prctile(d1, 75)); 
fprintf('91st percentile : %f\n', prctile(d1, 91)); 
fprintf('98th percentile : %f\n', prctile(d1, 98)); 

%% Visualisation - Scatter 
% A scatter plot is the easiest and thus first visualisation to be conducted
% the plot shows a strong cluster of values around the mean line, with a
% large gap between 80 and 100 on the Y axis as well as an unusual
% formation of points on the 0 line.
figure(1);
scatter(1:length(d1), d1);
hold on;
plot([0,length(d1)], [d1_mean, d1_mean])
hold off;
title('Task 1: Scatter plot')

%% Visualisation - Sorted Scatter
% A sort of the data provides a clearer understanding of the growth of the
% cumulitive distribution function and shows the break in the data in the 
% region around 90 - 100 
figure(2);
scatter(1:length(d1), sort(d1));
title('Task 1: Scatter plot sorted')

%% Visualisation - Histogram 
% At first glance a histogram shows a poisson distribution, this plot also
% confirms that the large number of values clustered at 0 do not fit into
% the curve of the distribution. The tail of the distribution also does not
% look normal, with an unexpected rise in values around 100

figure(3);
hist(d1, 1000);
title('Task 1: Histogram')

%% Visualisation - Box and Whisker 
% The box and whisker plot confirms the abnormality of the tail falls
% ouside the interquartile range of the distribution.  We can thus conclude
% that between 

figure(4);
boxplot(d1, 'Notch', 'on')
title('Task 1: Box plot')

%% Data Cleaning
% Data points larger than 53.3415 and equal to zero are removed from the
% set
figure(5);
temp = d1(d1 <= 98);
d1c = temp(temp > 0);
hist(d1c, 1000);

%% Mean, Variance, and Sample 
fprintf('\nAfter data cleaning:\n\n'); 
fprintf(['%d remaining datapoints in the set (%d removed)' ...
    '\n'], length(d1c), length(d1) - length(d1c)); 
fprintf('Minimum value : %f\n', min(d1c)); 
fprintf('Maximum value : %f\n', max(d1c));
fprintf('Mean value    : %f\n\n', mean(d1c));

d1c_sigma2 = sum((d1c - mean(d1c)).^2)/n-1;
fprintf('The variance is: %f\n\n', d1c_sigma2);
d1c_sigma = sqrt(d1c_sigma2);
fprintf('The standard deviation is: %f\n\n', d1c_sigma);

%% 7 Number Summary
fprintf('2nd percentile  : %f\n', prctile(d1c, 2)); 
fprintf('9th percentile  : %f\n', prctile(d1c, 9)); 
fprintf('1st quartile    : %f\n', prctile(d1c, 25)); 
fprintf('median value    : %f\n', median(d1c));
fprintf('3rd quartile    : %f\n', prctile(d1c, 75)); 
fprintf('91st percentile : %f\n', prctile(d1c, 91)); 
fprintf('98th percentile : %f\n', prctile(d1c, 98)); 

%% Skew
% The positive result indicates that the data is skewed to the left of the
% x axis, this tracks with the histogram shown
skew = 3 * (mean(d1c) - median(d1c))/d1c_sigma;
fprintf('\nSkew : %f\n', skew); 

%% Distribution
% It is hypothesised that the data comes from a Poisson distribution, shown
% by the fitting of a curve to the data set
poisson = @(x, mu) exp(-mu) * (mu.^x) / factorial(x);
normal = @(x, sigma, mu) (1/(sigma * sqrt(2 * pi)))*exp(-1/2 * ((x - mu)/sigma)^2);

l = zeros(ceil(max(d1)));
mu = mean(d1);
for x = 1:length(l)
    l(x) = normal(x, d1c_sigma, mu);
end%for

figure(6)
histogram(d1c, 'normalization', 'probability');
hold on;
plot(l, 'r')
hold off;


%% 