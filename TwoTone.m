% Author: Matthew Ren
%
% TwoTone is a function that converts an image to se only two different
% colours.
% Inputs: 
% rgbim: a m-by-n-by-3 uint8 array representing an RGB image
% colours: a 1-by-2-by-3 uint8 array representing the two RGB pixel colours
% to be used in our output image
% weightings: a 1-by-2-by-3 uint8 array representing two RGB pixel colours
% to be used as weightings for determining which output colour to apply
% Outputs: 
% tonedim:: An m-by-n-by-3 uint8 array representing the two toned output
% image
function [tonedim] = TwoTone(rgbim, colours, weightings)
% Our first output colour
colourA = colours(1,1,:);
% Our second output colour
colourB = colours(1,2,:);
% low is a colour closer to black
low = weightings(1,1,:);
% high is a colour closer to white
high = weightings(1,2,:);
% Set the toned image array to the dimensions of the input rgbim filled 
% with zeros with data type uint8
tonedim = zeros(size(rgbim), 'uint8');
% for i = 1 to the height of the array
for i = 1:height(rgbim)
    % for j = 1 to the width of the array
    for j = 1:width(rgbim)
        % lowdiff is the euclidean difference between a colour in position
        % (i,j) and the colour close to black with variable low
        lowdiff = ColourDifference(rgbim(i,j,:), low);
        % highdiff is the euclidean difference between a colour in position
        % (i,j) and the colour close to white with variable high
        highdiff = ColourDifference(rgbim(i,j,:), high);
        % if the colour in the original image is closer to low or
        % equidistance to low and high, 
        if lowdiff <= highdiff
            % replace that colour with colourA
            tonedim(i,j,:) = colourA;
            % otherwise,
        else
            % replace that colour with colourB
            tonedim(i,j,:) = colourB;
        end
    end
end
end