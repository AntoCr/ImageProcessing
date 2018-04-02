function [N] = impulsive_noise(a, pa, b, pb, N1, N2)
%
% [N] = impulsive_noise(a, pa, b, pb, N1, N2)
%
% creates N1 x N2 independent impulsive noise variables
% it assumes value a with probability pa, and value b with probability pb

S = rand(N1,N2);
N = zeros(N1, N2);
N(S < pa) = a;
N(S > 1 - pb) = b;

return