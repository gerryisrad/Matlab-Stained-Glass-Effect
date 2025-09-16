function FillAndLine(x, y, fillColor, varargin)
% This helper function fills a shape with color and then draws a black line around it.

% First, draw the colored part of the tile.
% Setting 'EdgeColor' to 'none' stops MATLAB from drawing its own border,
% so we can draw the one we want.
fill(x, y, fillColor, 'EdgeColor', 'none');

% To make the outline a closed loop, you have to add the first point to the end of the list.
x_outline = [x, x(1)];
y_outline = [y, y(1)];

% Now draw the black outline on top.
% varargin lets us pass in other settings, like the 'LineWidth'.
plot(x_outline, y_outline, 'Color', 'k', varargin{:});

end