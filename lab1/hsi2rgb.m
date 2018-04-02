function [RGB] = hsi2rgb(HSI)
%
% function [RGB] = hsi2rgb(HSI)
%
% convert HSI image to RGB
% HSI: 3-D array (float 0-1)
% RGB: 3-D array (integer 0-255)

H = HSI(:,:,1);
S = HSI(:,:,2);
I = HSI(:,:,3);

C1 = (H < 1/3);
C2 = (H >= 1/3 & H < 2/3);
C3 = (H >= 2/3);

H2 = H.*C1 + (H - 1/3).*C2 + (H - 2/3).*C3;
A1 = I.*(1 - S);
A2 = I.*(1 + S.*cos(2*pi*H2)./cos(pi/3-2*pi*H2));
A3 = 3*I - A1 - A2;

R = C1.*A2 + C2.*A1 + C3.*A3;
G = C1.*A3 + C2.*A2 + C3.*A1;
B = C1.*A1 + C2.*A3 + C3.*A2;

RGB(:,:,1) = uint8(255*R);
RGB(:,:,2) = uint8(255*G);
RGB(:,:,3) = uint8(255*B);

return