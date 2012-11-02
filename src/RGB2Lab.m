function Lab_im = RGB2Lab(RGB_im)
X0 = 94.81;
Y0 = 100.00;
Z0 = 107.304;

Lab_im = zeros(size(RGB_im));

XYZ_im = RGB2XYZ(RGB_im);

X = XYZ_im(:, :, 1) ./ X0;
Y = XYZ_im(:, :, 2) ./ Y0;
Z = XYZ_im(:, :, 3) ./ Z0;

index = Y <= 0.008856;

L = 116 .* (Y .^ (1/3)) - 16;
L(index) = 903.3 .* Y(index);

a = 500 * ((X .^ (1/3)) - (Y .^ (1/3)));
b = 200 * ((Y .^ (1/3)) - (Z .^ (1/3)));

Lab_im(:, :, 1) = L;
Lab_im(:, :, 2) = a;
Lab_im(:, :, 2) = b;
