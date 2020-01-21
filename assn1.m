%% Assignment 1
% Kelvin Lu
%
% Devin Kolarac
%
close all; clear; clc
try_diff_gammas = 1;

%% Part 1
pout = imread('pout.tif');
figure
imshow(pout)
title("Pout.tif original")

% Try gamma correction gamma < 1
poutv1 = gamma_correction(double(pout), 0.5);
poutv1 = uint8(poutv1);

figure
imshow(poutv1)
title("Pout.tif \gamma = 0.5")

% Try gamma correction gamma > 1
poutv2 = gamma_correction(double(pout), 2.0);
poutv2 = uint8(poutv2);

figure
imshow(poutv2)
title("Pout.tif \gamma = 2.0")

% Compare pixel value histograms
figure
hold on
title("Pout.tif pixel histogram");
xlabel("Bin")
ylabel("Frequency")
imhist(poutv1)
imhist(poutv2)
legend("Gamma = 0.5", "Gamma = 2.0");
hold off

% Trying different gammas
gammas = [0.25, 0.75, 1.0, 1.25, 1.5, 1.75];

if try_diff_gammas
    for i = 1:length(gammas)
        new_pout = gamma_correction(double(pout), gammas(i));
        new_pout = uint8(new_pout);

        figure
        imshow(new_pout);
        title(["Pout.tif \gamma = ", gammas(i)]);
    end
end

% Histogram Equalization
eq_pout = histeq(pout);

figure
imshow(eq_pout);
title("Pout.tif hist equalized");

figure
hold on
title("Pout.tif pixel histogram after equalization");
xlabel("Bin")
ylabel("Frequency")
imhist(eq_pout);
hold off

%% Part 2