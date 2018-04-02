function [N] = Laplacian_noise(sig, N1, N2)
%
% [N] = Laplacian_noise(sig, N1, N2)
%
% creates N1 x N2 independent Laplacian noise variables
% mean = 0, std dev = sig

S = 2*(rand(N1,N2) > 0.5) - 1;
N = S .* -log(rand(N1, N2))*sig/sqrt(2);
% N = S .* exprnd(sig/sqrt(2), N1, N2);

return