function DrawTiles(x, y, colr)
% This function takes the grid points and colors and draws all the tiles.

% Get the number of rows and columns of tiles from the color array's size.
[nr, nc, ~] = size(colr);

% Find the max x and y values to set the picture boundaries.
maxX = max(max(x));
maxY = max(max(y));

% --- Setup the window where we'll draw the stained glass ---
figure;
axis equal off;
axis([0 maxX 0 maxY]);
% 'hold on' is important, it lets us draw all the tiles in the same window
% without erasing the previous one.
hold on;

% OK, now loop through and draw every single tile.
for r = 1:nr
    for c = 1:nc
        % A tile is a square made of 4 grid points. Get the coordinates for these 4 corners.
        tile_x_coords = [x(r,c), x(r+1,c), x(r+1,c+1), x(r,c+1)];
        tile_y_coords = [y(r,c), y(r+1,c), y(r+1,c+1), y(r,c+1)];
        
        % Grab the color for this tile.
        % 'squeeze' is a weird trick to turn the 1x1x3 color array into a simple [R G B] vector.
        tile_color = squeeze(colr(r,c,:))';
        
        % Draw the tile using our helper function.
        % LineWidth 2 looked good in the example.
        FillAndLine(tile_x_coords, tile_y_coords, tile_color, 'LineWidth', 2);
    end
end

hold off; % Done drawing!

end