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
histogram(d1, 1000, 'normalization', 'probability');
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
% set due to the fact that they do not fall within the interquartile ranges
figure(5);
d1c = d1(d1 <= 53.3415);
d1c = d1c(d1c > 0);
histogram(d1c, 1000, 'normalization', 'probability');
title('Task 1: Histogram of cleaned data')

%% Mean, Variance, and Sample 
fprintf('\nAfter data cleaning:\n\n'); 
fprintf(['%d remaining datapoints in the set (%d removed)' ...
    '\n'], length(d1c), length(d1) - length(d1c)); 
fprintf('Minimum value : %f\n', min(d1c)); 
fprintf('Maximum value : %f\n', max(d1c));
d1c_mean = mean(d1c);
fprintf('Mean value    : %f\n\n', d1c_mean);

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
% It is hypothesised that the data comes from a Normal distribution, shown
% by the fitting of a curve to the data set
normal = @(x) (1./(d1c_sigma .* sqrt(2 .* pi))) * exp(-1/2 * ((x - d1c_mean) ./ d1c_sigma).^2);

figure(6)
histogram(d1c, 'normalization', 'probability');
hold on;
fplot(normal, 'r')
hold off;
title('Task 1: Fitted Distribution')


%% Task 2 
fprintf('\nTask 2\n\n'); 
d2 = data.task2_data;

%% Part A - Estimate Parameters
n = length(d2)
d2_mu_hat = sum(log(d2))./n;
d2_sigma_hat = sqrt( sum((log(d2) - d2_mu_hat).^2)./n );

fprintf('Estimated mean (mu hat)    : %f\n', d2_mu_hat); 
fprintf('Estimated mean (sigma hat) : %f\n', d2_sigma_hat); 

%% Part B - Density Histogram Plot
lognormal = @(x) 1 ./ (x.*d2_sigma_hat.*sqrt(2*pi)) .* exp( -(log(x) - d2_mu_hat).^2. ./ (2*d2_sigma_hat.^2));

figure(7)
histogram(d2, 'normalization', 'probability');
hold on;
fplot(lognormal, 'r')
hold off;

%% Part C - Chi Squared test
% For each bin value in our dataset calculate the expected value from the 
% distribution.  The null hypothesis is that the 
CDF = @(x) (1 + erf((log(x) - d2_mu_hat)./ (d2_sigma_hat * sqrt(2))))/2;
expected = @(x) CDF(x+1) - CDF(x);

obs = histcounts(d2);
exp = length(d2) .* expected(0:length(obs)-1);

nonZeroBins = obs(obs > 0);
noNonZeroBins = length(nonZeroBins)

figure(8)
plot(obs, 'b');
hold on;
plot(exp, 'r');
hold off;
title('Task 2: Observed and Expected values')


%% Calculate Chi Squared
% Create a function to calculate the Chi^2 value 
chiSqd = @(O, E) sum((O - E).^2 ./ E);
chiSquared = chiSqd(obs, exp);

% degree of freedom = No of non zero bins - no of estimate params
degreeOfFreedom = 63 - 2;

% Critical value = 1- alpha  = 0.95 in table
alpha = 0.05;
criticalValue = 1 - alpha;

fprintf('Calculated chi squared value: %f\n', chiSquared); 
fprintf('Degrees of Freedom: %f\n', degreeOfFreedom); 
fprintf('Alpha: %f\n', alpha); 
fprintf('Critical Value: %f\n', criticalValue); 

% After looking up in a table the p-Value = 42.188
% as the p value is greater than 


%% Task 3 - Part A
n = 10000
a_1 = 0;
a_2 = 63308;
a_3 = -183326;
b_1 = 86098;
b_2 = 0;
b_3 = -539608;
m_1 = 2147483647;
m_2 = 2145483479;

X = zeros(n + 3, 1);
X(1) = 5
X(2) = 1
X(3) = 9

Y = zeros(n + 3, 1);
Y(1) = 3;
Y(2) = 3;
Y(3) = 8;

Z = zeros(n + 3, 1);

for i = 4:n+3
    X(i) = mod((a_1 * X(i-1) + a_2 * X(i-2) + a_3 * X(i-3)), m_1);
    Y(i) = mod((b_1 * Y(i-1) + b_2 * Y(i-2) + b_3 * X(i-3)), m_2);
    Z(i) = mod((X(i)- Y(i)),m_1);
end

Z = Z(4:end)./m_1;

figure(9)
scatter(linspace(0, 1, n), Z);

%%  Part B: - Kolmogorov-Smirnov Test
% The zero hypothesis for the K-S test is that the distribution fits a
% uniform random distribution

U_pdf = ones(n, 1) ./ n;
U_cdf = cumsum(U_pdf)/sum(U_pdf);

Z_cdf = cumsum(Z)/sum(Z);

figure(10)
plot(1:length(U_cdf), U_cdf)
hold on;
plot(1:length(Z_cdf), Z_cdf, 'r')
hold off;
title('Uniform Distribution Generation')
legend('Perfect', 'Generated')

%%
delta = abs(Z_cdf - U_cdf);
d = max(delta);
criticalValue = 1.36/sqrt(n);
fprintf('D value: %f\n', d); 
fprintf('Critical Value: %f\n', criticalValue);

% As the critical value is smaller that the critical value the null
% hypothesis is not rejected. This means that the randomly generated values
% are not significantly differently distributed and are thus a "good" random
% set of values

%% Part C