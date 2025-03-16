% Author: Matthew Ren
%
%invertedim is a function that inverts an image's colours to its 
% complementary colours and returns the inverted image
% Inputs: inputim: a m-by-n-by-k uint8 array representing an RGB or 
% greyscale image
% Outputs: invertedim: a m-by-n-by-k uint8 array representing the inverted
% inputted image
function [invertedim] = Invert(inputim)
% Set the inverted image array to the dimensions of the input image array
% filled with zeros
invertedim = zeros(size(inputim));
% dimensions is the size of the input image
dimensions = size(inputim);
% for i = 1 to the height of the array
for i = 1:height(inputim)
    % for j = 1 to the width of the array
    for j = 1:width(inputim)
        % if the length of the dimensions array has a third entry, which 
        % would be the array that represents layers, it's an RGB image
        if length(dimensions) == 3
            % for k = 1 to 3, for each layer of the RGB array
            for k = 1:3
                % Invert the uint8 integer by subtracting each pixel from
                % 255
                invertedim(i,j,k) = 255 - inputim(i,j,k);
            end
        % else if the length of our dimensions variable is not 3, we
        % have a 2D array and so it's a greyscale image
        else
            % Invert the uint8 integer by subtracting each pixel from
            % 255
            invertedim(i,j) = 255 - inputim(i,j);
        end
    end
end
% Changes the data type of our image to uint8
invertedim = uint8(invertedim);
end