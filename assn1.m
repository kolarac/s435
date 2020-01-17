%% Assignment 1
% Kelvin Lu
%
% Devin Kolarac
%
%% Part 1
pout = imread('pout.tif');

poutv1 = gamma_correction(double(pout), 0.5);
poutv1 = uint8(poutv1);

figure
imshow(poutv1)

poutv2 = gamma_correction(doiguble(pout), 2.0);
poutv2 = uint8(poutv2);

figure
imshow(poutv2)

figure
hold on
imhist(poutv1)
imhist(poutv2)