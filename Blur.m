% Author: Matthew Ren
%
% The blur function blurs the inputted image by finding the average of 
% the pixel colours surrounding each pixel
% Inputs: 
% inputim: a m-by-n-by-k uint8 array representing an RGB or 
% greyscale image
% intensity: a positive, odd, integer that represents the magnitude of the 
% blurring
% Outputs: 
% blurredim: a m-by-n-by-k uint8 array representing the blurred
% inputted image
function [blurredim] = Blur(inputim, intensity)
% Set the blurred image array to the dimensions of the input image array
% filled with zeros
blurredim = zeros(size(inputim));
% Initially assume image is greyscale, so k = 1, only 1 layer
layers = 1;
% radius is a variable that represents the number of times we take adjacent
% pixels to each pixel, for example if radius = 1, we take the first group
% of adjacent pixels to get the average between a pixel and the pixels
% surrounding it; if radius = 2 we get the average between a pixel, its 
% first group and adjacent pixels and also the second group
radius = (intensity-1)/2;
% kernel represents the weight of the local neighbouring we take in conv2
kernel = ones(intensity);
% conv2 doesn't work with layers, so we separate the 3D array into three
% 2D arrays, inputim1 is the first layer of the inputted image
inputim1 = inputim(:,:,1);
% conv2 adds a pixels' local neighbours to each pixel in an image weighted
% by a kernel, 'same' tells the conv2 function to take pixels with the
% central pixel that overlaps with the input image, so conv2 works for
% every single pixel
% First layer of blurredim is the first layer of the inputted image that
% goes through the conv2 function
blurredim(:,:,1) = conv2(double(inputim1), kernel, 'same');
% If the number of dimensions is 3, the inputted image is a 3D array
if ndims(inputim) == 3
    % So, we set layers to 3 
    layers = 3;
    % inputim1 is the second layer of the inputted image
    inputim2 = inputim(:,:,2);
    % inputim1 is the third layer of the inputted image
    inputim3 = inputim(:,:,3);
    % Second layer of blurredim is the second layer of the inputted image 
    % that goes through the conv2 function
    blurredim(:,:,2) = conv2(double(inputim2), kernel, 'same');
    % Third layer of blurredim is the third layer of the inputted image 
    % that goes through the conv2 function
    blurredim(:,:,3) = conv2(double(inputim3), kernel, 'same');
end
% for i = 1 to the height of the inputted array
for i = 1:height(inputim)
    % for j = 1 to the width of the inputted array
    for j = 1:width(inputim)
        % for k = 1 to the number of layers
        for k = 1:layers
            % ilow is the lowest i value for a neighbouring pixel of a 
            % central pixel
            ilow = i-radius;
            % ihigh is the highest i value for a neighbouring pixel of a 
            % central pixel
            ihigh = i+radius;
            % jlow is the lowest j value for a neighbouring pixel of a 
            % central pixel
            jlow = j-radius;
            % jhigh is the highest j value for a neighbouring pixel of a 
            % central pixel
            jhigh = j+radius;
            %if ilow goes out of bounds of our array,
            if ilow < 1
                %set ilow to 1
                ilow = 1;
            end
            %if ihigh goes out of bounds of our array,
            if ihigh > height(inputim)
                %set ihigh to the height of the inputim
                ihigh = height(inputim);
            end
            %if jlow goes out of bounds of our array,
            if jlow < 1
                %set jlow to 1
                jlow = 1;
            end
            %if jhigh goes out of bounds of our array,
            if jhigh > width(inputim)
                %set jhigh to the width of the inputim
                jhigh = width(inputim);
            end
            % numbelements is the number of elements in a pixel and its
            % surrounding local pixels with weighted intensity, numel
            % counts the number of elements in an array
            numbelements = numel(inputim(ilow:ihigh, jlow:jhigh));
            % Currently each pixel in blurredim is the sum of itself and
            % its local neighbouring pixels, we now divide each pixel in 
            % blurredim by the number of pixels we used in conv2 that
            % calculated the sum of each pixel
            blurredim(i,j,k) = (blurredim(i,j,k))/numbelements;
        end
    end
end
% Changes the data type of our image to uint8
blurredim = uint8(blurredim);
end

