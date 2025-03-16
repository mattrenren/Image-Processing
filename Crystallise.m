% Author: Matthew Ren
%
% Crystallise is a function that creates a mosaic-like filter to the input 
% image by replacing each pixel with pixels in the nearest crystal location
% Inputs: 
% rgbim: a m-by-n-by-3 uint8 array representing an RGB image
% row: A 1-by-𝑛 double array representing the row co-ordinates of each
% crystal
% column: A 1-by-𝑛 double array representing the column co-ordinates of 
% each crystal
% Outputs: 
% crystalim: a m-by-n-by-3 uint8 array representing the crystallised image
function [crystalim] = Crystallise(rgbim, row, column)
% Set the crystallised image array to the dimensions of the input rgbim 
% filled with zeros with data type uint8
crystalim = zeros(size(rgbim), 'uint8');
% for i = 1 to the height of the input array
for i = 1:height(rgbim)
    % for j = 1 to the width of the input array
    for j = 1:width(rgbim)
        % nearestcrystal is a variable that represents the pixel position
        % of the nearest crystal, found using the FindClosest function
        nearestcrystal = FindClosest([i,j], row, column);
        % Replace each of the pixels in the crystallised image array with 
        % the values of the pixel of the nearest crystal in the original 
        % image
        crystalim(i,j,:) = rgbim(nearestcrystal(1),nearestcrystal(2),:);
    end
end
end