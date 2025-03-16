% Author: Matthew Ren
%
% FindClosest is a function that given a pixel position, finds the closest
% pixel from the given row and column co-ordinates
% Inputs: 
% pixelposition: A 1-by-2 double vector representing the position of a 
% pixel
% row: A 1-by-𝑛 double array representing the row co-ordinates of a set of
% pixels
% column: A 1-by-𝑛 double array representing the column co-ordinates of a 
% set of pixels.
% Outputs: 
% nearestpixel: A 1-by-2 double vector representing the position of the 
% closest pixel co-ordinates to the input position
function [nearestpixel] = FindClosest(pixelposition, row, column)
% closestdistance is a variable for the pixel coordinate that is closest
% to our original pixel, to make sure the first coordinate is always 
% the smallest initially because only 1 coordinat was taken, we set
% closestdistance to 10000, a random big number
closestdistance = 10000;
% for i = 1 to the width of the row array
for i = 1:width(row)
    % Equation to find euclidean distance 
    % tempdistance, short for temporary distance is a variable for the 
    % euclidean distance instantly calculated at pixel position i
    tempdistance = sqrt((row(i) - pixelposition(1))^2 + (column(i) - pixelposition(2))^2);
    % if the temporary distance that's calculated at pixel position i is
    % less than the previous closest distance,
    if tempdistance < closestdistance
        % set tempdistance to the closestdistance variable
        closestdistance = tempdistance; 
        % as the pixel at position i is the closest to our original pixel,
        % we set nearestpixel to row(i) and column(i).
        nearestpixel = [row(i), column(i)];
    end
end
end