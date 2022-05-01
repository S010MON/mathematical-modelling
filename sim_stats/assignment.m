
data = load("dataIndSSA2022.mat");
d1 = data.task1_data;

fprintf('Task 1\n'); 
fprintf('%d datapoints in the data set\n', length(d1)); 
fprintf('The minimum value is: %d\n', min(d1)); 
fprintf('The maximum value is: %d\n', max(d1));
fprintf('The median value is: %d\n', median(d1)); 
fprintf('The mean value is: %d\n', mean(d1)); 

% A scatter plot is the easiest and thus first 
figure(1);
scatter(1:d1_length, d1);
title('Task 1: Scatter plot')

% figure(2);
% hist(d1, 1000);
% title('Task 1: Histogram')
% 
% figure(3);
% boxplot(d1)
% title('Task 1: Box plot')
