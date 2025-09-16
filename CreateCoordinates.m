function [x, y] = CreateCoordinates(w, h, nx, ny)
% This function creates the grid points. It starts with a perfect grid and then
% messes up the inside points to make the tiles look irregular.

% --- 1. Make a regular grid ---
% First, make a perfectly spaced grid.
x_vector = linspace(0, w, nx);
% y goes from high to low so (0,0) is in the bottom-left of the picture.
y_vector = linspace(h, 0, ny); 
[x, y] = meshgrid(x_vector, y_vector);

% --- 2. Add randomness to the inside points ---
% How far apart are the points on the regular grid?
horizontalSpacing = w / (nx - 1);
verticalSpacing   = h / (ny - 1);

% The points can move up to 40% of the grid spacing.
xMaxNoise = 0.40 * horizontalSpacing;
yMaxNoise = 0.40 * verticalSpacing;

% Now, loop through the *inside* points only. Leave the border points alone.
for i = 2:(ny-1)
    for j = 2:(nx-1)
        % Get a random amount to shift the point.
        x_noise = (rand() * 2 * xMaxNoise) - xMaxNoise;
        y_noise = (rand() * 2 * yMaxNoise) - yMaxNoise;
        
        % Add the random shift to the point's original coordinates.
        x(i,j) = x(i,j) + x_noise;
        y(i,j) = y(i,j) + y_noise;
    end
end

end