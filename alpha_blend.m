clear;
clc;
close all;

% img_background = imresize(imread('park.jpg'), [900 900]);
img_background = imread('park.jpg');
img_foreground = imread('cat.png');

new_img = alphablend(img_background, img_foreground, 0.5, [0,0]);

imshow(new_img);

function b = alphablend(background, foreground, opacity, position)
    [back_height, back_width, back_plane] = size(background);
    [fore_height, fore_width, fore_plane] = size(foreground);
    x = position(1);
    y = position(2);
    
    for i = 1:fore_height
        for j = 1:fore_width
            if (x + i >= back_height || y + j >= back_width)
                continue
            end
            b(i,j) = (opacity * foreground(i,j)) + (1 - opacity) * background(i,j);
        end
    end
    
    % b = (opacity * tmp_foreground) + (1 - opacity) * tmp_background;
    % b = [back_height, back_width, fore_height, fore_width];
end