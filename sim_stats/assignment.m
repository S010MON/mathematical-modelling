%Start of the file

data = load("dataIndSSA2022.mat");
d1 = data.task1_data;

min = min(d1)
max = max(d1)
mean = mean(d1)
scatter(data.task1_data, 1:length(d1))