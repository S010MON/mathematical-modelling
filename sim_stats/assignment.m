clc;
clear;
data = load("dataIndSSA2022.mat");
d1 = data.task1_data;

%% Mean, Variance, and Sample 
fprintf('\nTask 1\n\n'); 
n = length(d1);
d1_mean = mean(d1);
fprintf('There are %d datapoints in the data set\n', n); 
fprintf('The minimum value is: %f\n', min(d1)); 
fprintf('The maximum value is: %f\n', max(d1));
fprintf('The mean value is: %f\n\n', d1_mean);

d1_var = sum((d1 - d1_mean).^2)/n-1;
fprintf('The variance is: %f\n\n', d1_var);

%% 7 Number Summary
fprintf('The 2nd percentile is: %f\n', prctile(d1, 2)); 
fprintf('The 9th percentile is: %f\n', prctile(d1, 9)); 
fprintf('The 1st quartile is: %f\n', prctile(d1, 25)); 
fprintf('The median value is: %f\n', median(d1));
fprintf('The 3rd quartile is: %f\n', prctile(d1, 75)); 
fprintf('The 91st percentile is: %f\n', prctile(d1, 91)); 
fprintf('The 98th percentile is: %f\n', prctile(d1, 98)); 

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

%% Visualisation - Histogram 
% At first glance a histogram shows a poisson distribution, this plot also
% confirms that the large number of values clustered at 0 do not fit into
% the curve of the distribution. The tail of the distribution also does not
% look normal, with an unexpected rise in values around 100

figure(2);
hist(d1, 1000);
title('Task 1: Histogram')

%% Visualisation - Box and Whisker 
% The box and whisker plot confirms the abnormality of the tail falls
% ouside the interquartile range of the distribution.  We can thus conclude
% that between 

figure(3);
boxplot(d1, 'Notch', 'on')
title('Task 1: Box plot')


%% Data Cleaning
figure(4);
d1_cl = d1(d1 <= 99);
d1_cl = d1_cl(d1_cl > 0);
hist(d1_cl, 1000);


%% Mean, Variance, and Sample 
fprintf('\nAfter data cleaning:\n'); 
n = length(d1);
fprintf('There are %d datapoints in the data set\n', n); 
fprintf('The minimum value is: %f\n', min(d1)); 
fprintf('The maximum value is: %f\n', max(d1));
fprintf('The mean value is: %f\n\n', mean(d1));

%% 7 Number Summary
fprintf('The 2nd percentile is: %f\n', prctile(d1, 2)); 
fprintf('The 9th percentile is: %f\n', prctile(d1, 9)); 
fprintf('The 1st quartile is: %f\n', prctile(d1, 25)); 
fprintf('The median value is: %f\n', median(d1));
fprintf('The 3rd quartile is: %f\n', prctile(d1, 75)); 
fprintf('The 91st percentile is: %f\n', prctile(d1, 91)); 
fprintf('The 98th percentile is: %f\n', prctile(d1, 98)); 
