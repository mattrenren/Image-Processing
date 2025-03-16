% Author: Matthew Ren
%
% The sketch function utilizes the greyscale, invert and blur function to
% convert an image into a sketch-like drawing
% Inputs: 
% inputim: a m-by-n-by-k uint8 array representing an RGB or greyscale image
% intensity: a positive, odd, integer that represents the magnitude of the 
% sketch lines
% Outputs: 
% sketchedim: a m-by-n-by-k uint8 array representing the sketched inputted 
% image
function [sketchedim] = Sketch(inputim,intensity)
% Set blendedim to the dimensions of the input image filled with zeros 
% with data type double
blendedim = zeros(height(inputim),width(inputim), 'double');
% backim is the greyscale of the inputted image in data type double
backim = double(Greyscale(inputim));
% frontim is the inverted, blurred greyscaled image of the inputted
% image in data type double
frontim = double(Blur(Invert(Greyscale(inputim)), intensity));
% for i = 1 to the height of the input array
for i = 1:height(inputim)
    % for j = 1 to the width of the input array
    for j = 1:width(inputim)
        % if a pixel is white in the back image, in line 32 
        % 255-backim(i,j) = 0, the blended pixel will be divided by 0, so,
        if backim(i,j) == 255
            % we replace the blended pixel with 255
            blendedim(i,j) = 255;
        else
            % formula to blend 2 pixels in position (i,j) together
            blendedim(i,j) = (255*frontim(i,j))/(255-backim(i,j));
        end
    end
end
% our final sketched image will be the uint8 form of our blended image
sketchedim = uint8(blendedim);
end