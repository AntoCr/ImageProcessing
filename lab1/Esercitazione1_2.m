% esercitazione1_2
%% primo punto
load('lenna512.mat');
load('barbara.mat');

x = Gaussian_noise(12,512,512);
u = uniform_noise(21,512,512);
l = Laplacian_noise(12,512,512);
i = impulsive_noise(120,0.005,-120,0.005,512,512);

figure, subplot(3,2,1), imshow(barbara, [0 255]);
barba_g = barbara + x;

v = var(x(:));
v_i = var(barbara(:));
B_SNR = 10*log10(v_i/v);

subplot(3,2,3),  imshow(barba_g, [0 255]);
barba_u = barbara + u;
subplot(3,2,4), imshow(barba_u, [0 255]);
barba_l = barbara + l;
subplot(3,2,5), imshow(barba_l, [0 255]);
barba_i = barbara + i;
subplot(3,2,6), imshow(barba_i, [0 255]);


figure, subplot(3,2,1), imshow(lenna512, [0 255]);
lenna512_g = lenna512 + x;

v = var(x(:));
v_i = var(lenna512(:));
L_SNR = 10*log10(v_i/v);

subplot(3,2,3),  imshow(lenna512_g, [0 255]);
lenna512_u = lenna512 + u;
subplot(3,2,4),  imshow(lenna512_u, [0 255]);
lenna512_l = lenna512 + l;
subplot(3,2,5),  imshow(lenna512_l, [0 255]);
lenna512_i = lenna512 + i;
subplot(3,2,6),  imshow(lenna512_i, [0 255]);

%% secondo punto

%maschera a media
M = ones(3,3)*(1/9);

%barbara
barba_gM = imfilter(barba_g, M, 'symmetric');

    figure, subplot(3,2,1), imshow(barbara,[0 255]);
    subplot(3,2,2), imshow(barba_g,[0 255]);
    subplot(3,2,3), imshow(barba_gM, [0 255]);

Res = barba_gM - barbara;
v = var(Res(:));
v_i = var(barbara(:));
B_SNRg = 10*log10(v_i/v);

barba_uM = imfilter(barba_u, M, 'symmetric');
    subplot(3,2,4), imshow(barba_uM, [0 255]);

Res = barba_uM - barbara;
v = var(Res(:));
B_SNRu = 10*log10(v_i/v);

barba_lM = imfilter(barba_l, M, 'symmetric');
    subplot(3,2,5), imshow(barba_lM, [0 255]);

Res = barba_lM - barbara;
v = var(Res(:));
B_SNRl = 10*log10(v_i/v);

barba_iM = imfilter(barba_i, M, 'symmetric');
    subplot(3,2,6), imshow(barba_iM, [0 255]);

Res = barba_iM - barbara;
v = var(Res(:));
B_SNRi = 10*log10(v_i/v);

%lenna
lenna_gM = imfilter(lenna512_g, M, 'symmetric');
figure, subplot(3,2,1), imshow(lenna512, [0 255]);
subplot(3,2,2), imshow(lenna512_g, [0 255]);
subplot(3,2,3), imshow(lenna_gM, [0 255]);

    Res = lenna_gM - lenna512;
    v = var(Res(:));
    v_i = var(lenna512(:));
    L_SNRg = 10*log10(v_i/v);

lenna_uM = imfilter(lenna512_u, M, 'symmetric');
subplot(3,2,4), imshow(lenna_uM, [0 255]);

    Res = lenna_uM - lenna512;
    v = var(Res(:));
    L_SNRu = 10*log10(v_i/v);

lenna_lM = imfilter(lenna512_l, M, 'symmetric');
subplot(3,2,5), imshow(lenna_lM, [0 255]);

    Res = lenna_lM - lenna512;
    v = var(Res(:));
    L_SNRl = 10*log10(v_i/v); 
    
lenna_iM = imfilter(lenna512_i, M, 'symmetric');
subplot(3,2,6), imshow(lenna_iM, [0 255]);

    Res = lenna_iM - lenna512;
    v = var(Res(:));
    L_SNRi = 10*log10(v_i/v);


%% terzo punto

% barbara
MD_barbaG = medfilt2(barba_g,[3 3],'symmetric');
    figure, subplot(3,2,1), imshow(barbara,[0 255]);
    %subplot(3,2,2), imshow(barba_g,[0 255]);
    subplot(3,2,3), imshow(MD_barbaG, [0 255]);
    
    v_i = var(barbara(:));
    Res = MD_barbaG - barbara;
    v = var(Res(:));
    B_SNR_MDg = 10*log10(v_i/v);
    
MD_barbaU = medfilt2(barba_u,[3 3],'symmetric'); 
    subplot(3,2,4), imshow(MD_barbaU, [0 255]);
    
    Res = MD_barbaU - barbara;
    v = var(Res(:));
    B_SNR_MDu = 10*log10(v_i/v);
    
MD_barbaL = medfilt2(barba_l,[3 3],'symmetric'); 
    subplot(3,2,5), imshow(MD_barbaL, [0 255]);
    
    Res = MD_barbaL - barbara;
    v = var(Res(:));
    B_SNR_MDl = 10*log10(v_i/v);
    
MD_barbaI = medfilt2(barba_i,[3 3],'symmetric'); 
    subplot(3,2,6), imshow(MD_barbaI, [0 255]);
    
    Res = MD_barbaI - barbara;
    v = var(Res(:));
    B_SNR_MDi = 10*log10(v_i/v);
    
% lenna
MD_lennaG = medfilt2(lenna512_g,[3 3],'symmetric');

    figure, subplot(3,2,1), imshow(lenna512,[0 255]);
    %subplot(3,2,2), imshow(barba_g,[0 255]);
    subplot(3,2,3), imshow(MD_lennaG, [0 255]);
    
    v_i = var(lenna512(:));
    Res = MD_lennaG - lenna512;
    v = var(Res(:));
    L_SNR_MDg = 10*log10(v_i/v);

MD_lennaU = medfilt2(lenna512_u,[3 3],'symmetric');
  
    subplot(3,2,4), imshow(MD_lennaG, [0 255]);

    Res = MD_lennaU - lenna512;
    v = var(Res(:));
    L_SNR_MDu = 10*log10(v_i/v);

MD_lennaL = medfilt2(lenna512_l,[3 3],'symmetric');

    subplot(3,2,5), imshow(MD_lennaL, [0 255]);

    Res = MD_lennaL - lenna512;
    v = var(Res(:));
    L_SNR_MDl = 10*log10(v_i/v);

MD_lennaI = medfilt2(lenna512_i,[3 3],'symmetric');

    subplot(3,2,6), imshow(MD_lennaI, [0 255]);

    Res = MD_lennaI - lenna512;
    v = var(Res(:));
    L_SNR_MDi = 10*log10(v_i/v);
    
%% 4 point
load('boat.mat');

PSF=fspecial('motion',31,17);
boat_f=imfilter(boat,PSF,'conv','circular');
figure, subplot(1,2,1), imshow(boat,[0 255]);
subplot(1,2,2), imshow(boat_f, [0 255]);