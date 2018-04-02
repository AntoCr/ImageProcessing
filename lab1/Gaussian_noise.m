function [N] = Gaussian_noise(sig, N1, N2)
%
% [N] = Gaussian_noise(sig, N1, N2)
%
% creates N1 x N2 independent Gaussian noise variables
% mean = 0, std dev = sig

N = sig * randn(N1,N2);

return