% Author: Matthew Ren
%
% ColourDifference is a function that calculates the euclidean difference
% between colours in corresponding pixels of two inputs
% Inputs: 
% array1: a m-by-n-by-3 uint8 array representing one array of colours
% array2: a m-by-n-by-3 uint8 array representing a second array of
% colours
% Outputs: eucliddiff: a m-by-n doubles array representing the euclidean
% difference in colour between corresponding pixels of the inputs
function [eucliddiff] = ColourDifference(array1, array2)
% Set array1's data type to double
array1 = double(array1);
% Set array2's data type to double
array2 = double(array2);
% Set the euclidean difference array to the dimensions of the input array1
% filled with zeros as data type double
eucliddiff = double(zeros(height(array1),width(array1)));
% for i = 1 to the height of the array
for i = 1:height(array1)
    % for j = 1 to the width of the array
    for j = 1:width(array1)
        % equation to calculate the euclidean difference
        eucliddiff(i,j) = sqrt((array2(i,j,1) - array1(i,j,1))^2 + (array2(i,j,2) - array1(i,j,2))^2 + (array2(i,j,3) - array1(i,j,3))^2);
    end
end
end