% Joel Karel
% Universiteit Maastricht
% joelkarel@ieee.org
%
% This version: 04/02/2005
%
% PLOTTRAJECTORY
% Plots a trajectory for a pair of two differential equations
% 
% Parameters
%   trajectory
%       The trajectory. The values for each of the two variables is in a
%       row. So if one simulates a system for 1000 samples then trajectory
%       has dimensions 2 x 1000
%   tail
%       The length of the history that should be plotted. Can be used to
%       speed up the animations since plotting will become harder towards
%       the end. (default: plot full history)
%   dl
%       Optional parameter that represents the delay time. (default:
%       0.0001) that is faster then the computer will be able to display.
function [] = plotTrajectory(trajectory,tail,dl)
%check input parameters
if(nargin<3)
    dl=0.0001;
end
if(nargin<2)
    tail=size(trajectory,2);
end

%determine the size of the axis
as=[min(trajectory(1,:)) max(trajectory(1,:)) min(trajectory(2,:)) max(trajectory(2,:))];
%create a new figure
figure
%set double buffering on for smooth animations
set(gcf,'DoubleBuffer','on')
hold on
axis(as);
axis manual
%plot trajectory
for cnt=1:size(trajectory,2),
    cla %clear the axis to avoid hold off that resets the axis
    starttail=max([1,cnt-tail]); %avoid being out-of-bound
    %plot the tail of the trajectory
    plot(trajectory(1,starttail:cnt),trajectory(2,starttail:cnt),'b.');
    %plot current point
    plot(trajectory(1,cnt),trajectory(2,cnt),'r*');
    pause(dl);
end