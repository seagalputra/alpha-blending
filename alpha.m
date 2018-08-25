clear;
clc;
close all;

% Read image from file
img_background = imread('park.jpg');
img_foreground = imread('cat.png');

% Define size of image
[height, width, plane] = size(img_background);

% Separate R,G,B in background image
R_background = img_background(:,:,1);
G_background = img_background(:,:,2);
B_background = img_background(:,:,3);

% Separate R,G,B in foreground image
R_foreground = img_foreground(:,:,1);
G_foreground = img_foreground(:,:,2);
B_foreground = img_foreground(:,:,3);

% Create new image using zeros value
R_new_img = zeros(height, width);
G_new_img = zeros(height, width);
B_new_img = zeros(height, width);
new_img = zeros(height, width, plane);

R_new_img = uint8(R_new_img);
G_new_img = uint8(G_new_img);
B_new_img = uint8(B_new_img);

tmp_background = double(img_background);
tmp_foreground = double(img_foreground);

new_img = cat(3,R_background,G_background,B_background);

% Assign opacity value for operation
opacity = 0.8;

% Alpha Blending operation
% for i = 1:height
%   for j = 1:width
%     R_new_img(i,j) = (opacity * R_foreground(i,j)) + (1 - opacity) * R_background(i,j);
%     G_new_img(i,j) = (opacity * G_foreground(i,j)) + (1 - opacity) * G_background(i,j);
%     B_new_img(i,j) = (opacity * B_foreground(i,j)) + (1 - opacity) * B_background(i,j);
%   end
%   disp('iteration - '); disp(i);
% end

% new_img = (opacity * tmp_foreground) + (1 - opacity) * tmp_background;

new_img = cat(3, R_new_img, G_new_img, B_new_img);
imshow(uint8(new_img), []);
subplot(1,2,1); imshow(img_background);
subplot(1,2,2); imshow(img_foreground);