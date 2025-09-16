# MATLAB Stained Glass Effect

This is a personal project I created in MATLAB to explore image processing. It takes a normal photo and applies a "stained glass" filter, transforming it into a piece of art. I built it to experiment with array manipulation and custom graphics functions.

## Example
![Example of Stained Glass Effect Before](https://github.com/gerryisrad/Matlab-Stained-Glass-Effect/blob/main/Mantis.jpg)
![Example of Stained Glass Effect After](https://github.com/gerryisrad/Matlab-Stained-Glass-Effect/blob/main/Stained_Glass_Mantis.png)

***

## How It Works

The script works in a few main steps:

1.  **Analyze the Image:** It first loads an image and divides it into a grid of rectangular blocks.
2.  **Find Average Colors:** For each block, it calculates the average Red, Green, and Blue color value. This average color will be the color of a single piece of "glass."
3.  **Create an Irregular Grid:** It generates a new grid of points that will serve as the corners for the glass tiles. To make it look more natural, it randomly shifts the *interior* points of the grid, leaving the border fixed. This creates a bunch of unique quadrilateral shapes.
4.  **Draw the Final Image:** Finally, it draws each quadrilateral tile one by one, filling it with the corresponding average color and adding a black border to complete the stained glass effect.

***

## How to Use

1.  Make sure all four `.m` files are in the same folder or in your MATLAB path.
2.  Open MATLAB and navigate to that folder.
3.  Run the main function from the command window with three arguments:
    * The name of your image file (e.g., `'my_photo.jpg'`)
    * The number of rows of tiles you want (e.g., `30`)
    * The number of columns of tiles you want (e.g., `45`)

**Example:**
```matlab
StainedGlassEffect('anaheim.jpg', 30, 45);
