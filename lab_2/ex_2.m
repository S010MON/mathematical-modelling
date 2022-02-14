load('dataset.mat')

u = data.x;
t = data.t;

lsim(sys2, u, t)