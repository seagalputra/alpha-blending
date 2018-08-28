clear;
clc;
close all;

img_background = imread('pic/brown_cat.jpg');
[foreground, map, alpha] = imread('pic/cat.png');
img_foreground = imresize(foreground, [600 600]);

% maintain alpha value in between 0 and 1
alpha = imresize(alpha, [600, 600]);
alpha = double(alpha/255.0);

% Separate each color channel of the background
red_background = double(img_background(:,:,1));
green_background = double(img_background(:,:,2));
blue_background = double(img_background(:,:,3));

% Separate each color channel of the foreground
red_foreground = double(img_foreground(:,:,1));
green_foreground = double(img_foreground(:,:,2));
blue_foreground = double(img_foreground(:,:,3));

red_new_img = alpha.*red_foreground + (1.0 - alpha).*red_background;
green_new_img = alpha.*green_foreground + (1.0 - alpha).*green_background;
blue_new_img = alpha.*blue_foreground + (1.0 - alpha).*blue_background;

new_img = cat(3, red_new_img, green_new_img, blue_new_img);
new_img = uint8(new_img);

subplot(1,3,1); imshow(img_background); title('Background');
subplot(1,3,2); imshow(img_foreground); title('Foreground');
subplot(1,3,3); imshow(new_img); title('New Image');