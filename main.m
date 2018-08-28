clear;
clc;
close all;

img_background = imread('pic/brown_cat.jpg');
img_foreground = imread('pic/cat.png');

[height_background, width_background, plane] = size(img_background);
img_foreground = imresize(img_foreground, [height_background width_background]);

alpha = 0.75;

% separate image color channel for background and foreground
red_img_background = img_background(:,:,1);
green_img_background = img_background(:,:,2);
blue_img_background = img_background(:,:,3);

red_img_foreground = img_foreground(:,:,1);
green_img_foreground = img_foreground(:,:,2);
blue_img_foreground = img_foreground(:,:,3);

% do alpha blending
red_new_img = alphablend(red_img_background, red_img_foreground, alpha);
green_new_img = alphablend(green_img_background, green_img_foreground, alpha);
blue_new_img = alphablend(blue_img_background, blue_img_foreground, alpha);

new_img = cat(3, red_new_img, green_new_img, blue_new_img);
new_img = uint8(new_img);

subplot(1,3,1); imshow(img_background); title('Background');
subplot(1,3,2); imshow(img_foreground); title('Foreground');
subplot(1,3,3); imshow(new_img); title('New image');