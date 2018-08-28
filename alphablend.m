function b = alphablend(background, foreground, alpha)
    size_background = size(background);
    size_foreground = size(foreground);
    
    for i = 1:size_foreground(1)
        for j = 1:size_foreground(2)
            b(i,j) = (alpha * foreground(i,j)) + (1 - alpha) * background(i,j);
        end
    end
end