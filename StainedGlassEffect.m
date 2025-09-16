function [x, y, colr] = StainedGlassEffect(imFile, nr, nc)
% This is the main function. It takes an image file and the number of tiles
% you want (rows and columns), and it makes the stained glass picture.

% --- 1. Get the image ready ---
% Load the image.
im = imread(imFile);

% Show the original pic in its own window.
figure(1);
imshow(im);
title('Original Image');

% Get the height and width of the image.
[nrIm, ncIm, ~] = size(im);

% --- 2. Figure out the color for each tile ---
% Make an empty 3D array to store the RGB color for each tile.
colr = zeros(nr, nc, 3);

% These are the dividing lines for our tiles. This splits the image into blocks.
row_dividers = round(linspace(1, nrIm + 1, nr + 1));
col_dividers = round(linspace(1, ncIm + 1, nc + 1));

% Loop through every tile to figure out its color.
for r = 1:nr
    for c = 1:nc
        % Get the top, bottom, left, and right edges for this block of pixels.
        row_start = row_dividers(r);
        row_end   = row_dividers(r+1) - 1;
        col_start = col_dividers(c);
        col_end   = col_dividers(c+1) - 1;
        
        % Grab that block of pixels from the main image.
        pixel_block = im(row_start:row_end, col_start:col_end, :);
        
        % IMPORTANT: have to convert to double! If you just add uint8 numbers,
        % they max out at 255 and the average will be calculated wrong.
        pixel_block_double = double(pixel_block);
        
        % Find the average red, green, and blue in this block.
        avg_red   = mean(mean(pixel_block_double(:,:,1)));
        avg_green = mean(mean(pixel_block_double(:,:,2)));
        avg_blue  = mean(mean(pixel_block_double(:,:,3)));
        
        % Save the color. Divide by 255 to get it in the [0, 1] range.
        colr(r, c, 1) = avg_red / 255;
        colr(r, c, 2) = avg_green / 255;
        colr(r, c, 3) = avg_blue / 255;
    end
end

% --- 3. Create and draw the final picture ---
% Now, create the wiggly grid points for the corners of the tiles.
[x, y] = CreateCoordinates(ncIm, nrIm, nc + 1, nr + 1);

% Call the function to actually draw everything.
DrawTiles(x, y, colr);

end