%Start of the file

data = load("dataIndSSA2022.mat");
d1 = data.task1_data;

d1_length = length(d1)
d1_min = min(data.task1_data)
d1_max = max(d1)
d1_mean = mean(d1)
d1_median = median(d1)

scatter(1:d1_length, d1);

hist(d1, 1000)

boxchart(1:d1_length, d1)