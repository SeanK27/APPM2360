originalImage = imread("rectangle.jpg");
imageDouble = double(originalImage);

[rows, cols] = size(imageDouble(:,:,1));

% Create Identity Matrix
I = eye(cols);

% Define Shift Amount
shiftAmount = 306;

transformationMatrix = zeros(cols);

% Fill in first 306 columns of t with the last 306 columns of I
transformationMatrix(:, 1:shiftAmount) = I(:, cols - (shiftAmount-1):cols);

% Fill in rest of transormation matrix with first part of identity
% matrix
transformationMatrix(:, shiftAmount+1:cols) = I(:, 1:cols-shiftAmount);

imageDouble(:,:,1) = imageDouble(:,:,1) * transformationMatrix;
imageDouble(:,:,2) = imageDouble(:,:,2) * transformationMatrix;
imageDouble(:,:,3) = imageDouble(:,:,3) * transformationMatrix;

imwrite(imageDouble, 'Q5a.jpg');

% Display Original and Shifted Image
figure(1)
subplot(121)
imagesc(uint8(originalImage))
title('Original Image')

subplot(122)
imagesc(uint8(imageDouble))
title('Shifted Image (306 pixels right)')

% Display the transformation matrix
figure(2)
spy(transformationMatrix)
title('Transformation Matrix')