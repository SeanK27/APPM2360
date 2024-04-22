imageGrayscaleInt = imread('grayrectangle.jpg');

% Manipulation Code
highExposureImage = 2 * imageGrayscaleInt;

% Set up Subplot Layout
subplot(1,2,1);
% Display the Image
imshow(imageGrayscaleInt);
% Add Title to Subplot
title('Original Image');

% Set up Subplot Layout
subplot(1,2,2);
% Display the Image
imshow(highExposureImage);
% Add Title to Subplot
title('Image with Increased Exposure');

% Write the high exposure image to high_exposure_grayrectangle.jpg
imwrite(highExposureImage, 'high_exposure_grayrectangle.jpg');