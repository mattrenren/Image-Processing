% Author: Matthew Ren
%
% Inputs: rgbim: a m-by-n-by-3 uint8 array representing an RGB image
% Outputs: gsim: a m-by-n-by-1 uint8 array representing a greyscale image
function [gsim] = Greyscale(rgbim)
% Changes the data type in our RGB image from uint8 to double
rgbim = double(rgbim);
% Set variable m to the height of the RGB image array 
m = height(rgbim);
% Set variable n to the width of the RGB image array 
n = width(rgbim);
% Set the greyscale image array to the dimensions of thee RGB image array
% filled with zeros
gsim = zeros(m,n);
% for i = 1 to the height of the array
for i = 1:m
    % for j = 1 to the width of the array
    for j = 1:n
        % For each pixel, calculate the grey pixel value by applying the 
        % ratio 3:5:1
        gsim(i,j) = rgbim(i,j,1)*3/9 + rgbim(i,j,2)*5/9 + rgbim(i,j,3)/9;
    end
end
% Changes the data type of our greyscale image from double back to uint8
gsim = uint8(gsim);
end