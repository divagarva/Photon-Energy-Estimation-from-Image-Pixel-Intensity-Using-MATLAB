% Load the image
img = imread('tiger.jpg');
img_gray = rgb2gray(img);  % Convert to grayscale if necessary

% Define constants
h = 6.626e-34;   % Planck’s constant (J·s)
c = 3e8;         % Speed of light (m/s)

% Assuming you are working with visible light, define a sample wavelength range (in meters)
lambda_min = 400e-9;  % 400 nm (violet)
lambda_max = 700e-9;  % 700 nm (red)

% Normalize the pixel intensities to get a corresponding wavelength for each pixel
img_double = im2double(img_gray);  % Convert image to double for computation
lambda = lambda_min + (lambda_max - lambda_min) * (1 - img_double);  % Map pixel values to wavelength

% Calculate the photon energy for each pixel
E = (h * c) ./ lambda;  % Energy in Joules

% Display the energy image
figure;
imshow(E, []);
title('Photon Energy of Image Pixels (in Joules)');

% Optionally, scale energy values for visualization
scaled_E = mat2gray(E);  % Scale between 0 and 1
figure;
imshow(scaled_E);
title('Scaled Photon Energy');
