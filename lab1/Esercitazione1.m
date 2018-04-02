%esercitazione 1
%%primo punto

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

%%secondo punto
I_h=histeq(I_double,256);
figure, imhist(I_h, 256);
figure, imhist(Y1, 256);
figure, imhist(Y2, 256);
figure, imhist(Y3, 256);
figure, imhist(Y4, 256);

