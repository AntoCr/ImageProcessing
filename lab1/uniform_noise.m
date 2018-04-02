function [N] = uniform_noise(A, N1, N2)
%
% [N] = uniform_noise(A, N1, N2)
%
% creates N1 x N2 independent uniform noise variables
% uniformly distributed in [-A, A]

N = 2*A * rand(N1,N2) - A;

return