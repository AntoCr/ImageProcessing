%esercitazione 1_1
%% primo punto

I=imread('Goldhill512.tif');
figure, imshow(I);

I_double=double(I)/255;

LOW_IN=min(I_double(:));
HIGH_IN=max(I_double(:));
LOW_OUT=0;
HIGH_OUT=1;

Y1 = imadjust(I,[LOW_IN; HIGH_IN],[LOW_OUT; HIGH_OUT]);
figure, imshow(Y1);

LOW_HIGH = stretchlim(I_double, [0.01, 0.99]);

Y2 = imadjust(I,LOW_HIGH,[LOW_OUT; HIGH_OUT]);
figure, imshow(Y2);

LOW_HIGH = stretchlim(I_double, [0.05, 0.95]);

Y3 = imadjust(I,LOW_HIGH,[LOW_OUT; HIGH_OUT]);
figure, imshow(Y3);

LOW_HIGH = stretchlim(I_double, [0.10, 0.90]);

Y4 = imadjust(I,LOW_HIGH,[LOW_OUT; HIGH_OUT]);
figure, imshow(Y4);

%% secondo punto
I_h=histeq(I_double,256);
figure, imhist(I_h, 256);
figure, imhist(Y1, 256);
figure, imhist(Y2, 256);
figure, imhist(Y3, 256);
figure, imhist(Y4, 256);

%% terzo punto
BAB = imread('baboon.tiff');
figure,  imshow(BAB);

BAB_double=double(BAB)/255;


    BAB_R = BAB_double(:,:,1);
        figure, imshow(BAB_R);
    BAB_G = BAB_double(:,:,2);
    BAB_B = BAB_double(:,:,3);
    
    Req = histeq(BAB_R,256);
        figure, imshow(Req);
    Beq = histeq(BAB_B,256);
    Geq = histeq(BAB_G,256);
    
    BAB_eq= cat(3, Req, Beq, Geq);
    figure, imshow(BAB_eq);
    figure, imhist(BAB_eq, 256);
    
%% quarto punto
figure, imshow(BAB_double);
HSI = rgb2hsi(BAB_double);
figure, imshow(HSI);

H = HSI(:,:,1);
S = HSI(:,:,2);
I = HSI(:,:,3);
figure, imshow(I);

I_eq = histeq(I,256);
figure, imshow(I_eq);

HSI_eq = cat(3,H,S,I_eq);
figure, imshow(HSI_eq);

RGB = hsi2rgb(HSI_eq);
figure, imshow(RGB);

%% problema
CH = imread('challenge01.tif');
CH_double = double(CH)/256;
figure, imshow(CH_double);
figure, imhist(CH_double, 256);

CH_eq = histeq(CH_double, 256);
figure, imshow(CH_eq);
figure, imhist(CH_eq, 256);


CH1 = CH_eq * 3;
figure, imshow(CH1);

CH3 = CH_eq * 0.4;
figure, imshow(CH3);

LOW_IN = min(CH_double(:));
HIGH_IN = 0.2;
HIGH_OUT = 1;
LOW_OUT = 0;

Y1 = imadjust(CH_double,[LOW_IN; HIGH_IN],[LOW_OUT; HIGH_OUT]);
figure, imshow(Y1);
figure, imhist(Y1,256);
Y1_eq = histeq(Y1, 256);
figure, imshow(Y1_eq);
figure, imhist(Y1_eq, 256);

LOW_IN = 0.63;
HIGH_IN = 0.675;
HIGH_OUT = 1;
LOW_OUT = 0.2;

Y2 = imadjust(CH_double,[LOW_IN; HIGH_IN],[LOW_OUT; HIGH_OUT]);
figure, imshow(Y2);
figure, imhist(Y2,256); 
    
    
%% idx= Y2(:)==0;

Y2(idx==1)=1;
figure, imshow(Y2);

Y=cat(3,Y1,Y2);
figure, imshow(Y);