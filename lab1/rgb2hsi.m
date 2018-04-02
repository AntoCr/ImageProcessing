function [HSI] = rgb2hsi(RGB)
%
% function [HSI] = rgb2hsi(RGB)
%
% convert RGB image to HSI
% RGB: 3-D array (integer 0-255 or float 0-1)
% HSI: 3-D array (float 0-1)


R = RGB(:,:,1);
G = RGB(:,:,2);
B = RGB(:,:,3);
% convert to double in [0, 1]
if isinteger(RGB)
    R = double(R)/255;
    G = double(G)/255;
    B = double(B)/255;
end

theta = acos(min(max((2*R-G-B)/2./sqrt((R-G).^2 + (R-B).*(G-B)),-1),1))/pi/2;
HSI(:,:,1) = (B <= G).*theta + (B > G).*(1 - theta);
HSI(:,:,2) = 1 - 3./(R+G+B).*min(cat(3,R,G,B),[],3);
HSI(:,:,3) = (R+G+B)/3;
HSI(isnan(HSI)) = 0;

return