%% Algorithm for computing transfer function from state-space representation
% Inputs: state-space representation by specifying A, B, C, D
% outputs: 
%   b - the coefficients of the numerator polynomial of transfer function,
%   a - the coefficients of the denominator polynomial a of transfer function
%   S - and a cell array S containing S1 through Sn
function [b,a,S] = fadeev(A,B,C,D)

   a = []
   b = []; 
   S = {};
   S{1} = eye(size(A));
   
   for k = 1:length(A)

            a = [a, - (trace(A * S{k})) / k]
            S{k+1} = A * S{k} + a(k) * S{1}   

   end%for


   for k = 1:length(A)
        b(k) = C * S{k} * B + D
   end%for

end%function

