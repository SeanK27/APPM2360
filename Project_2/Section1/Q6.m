originalImage = imread("rectangle.jpg");
imageDouble = double(originalImage);

[rows, cols] = size(imageDouble(:,:,1));

% Create Identity Matrix
I = eye(cols);
I2 = eye(rows);

% Define Shift Amount
shiftAmount = 306;
shiftAmount2 = 1080-230;

transformationMatrixhorizontal = zeros(cols);
transformationMatrixvertical = zeros(rows);

%%%%%%%%%%%Horizontal Shift%%%%%%%%%%%%%%%%%%%%

% Fill in first 306 rows of t with the last 306 rows of I
transformationMatrixhorizontal(:, 1:shiftAmount) = I(:, cols - (shiftAmount-1):cols);

% Fill in rest of transormation matrix with first part of identity
% matrix
transformationMatrixhorizontal(:, shiftAmount+1:cols) = I(:, 1:cols-shiftAmount);

imageDouble(:,:,1) = imageDouble(:,:,1) * transformationMatrixhorizontal;
imageDouble(:,:,2) = imageDouble(:,:,2) * transformationMatrixhorizontal;
imageDouble(:,:,3) = imageDouble(:,:,3) * transformationMatrixhorizontal;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%Vertical Shift%%%%%%%%%%%%%%%

% Fill in first 1080-230 rows of t with the last 1080-230 rows of I
transformationMatrixvertical(1:shiftAmount2, :) = I2( rows - (shiftAmount2-1):rows, :);

% Fill in rest of transormation matrix with first part of identity
% matrix
transformationMatrixvertical(shiftAmount2+1:rows, :) = I2(1:rows-shiftAmount2, :);

imageDouble(:,:,1) = transformationMatrixvertical * imageDouble(:,:,1);
imageDouble(:,:,2) = transformationMatrixvertical * imageDouble(:,:,2);
imageDouble(:,:,3) = transformationMatrixvertical * imageDouble(:,:,3);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


imwrite(imageDouble, 'Q5a.jpg');
%imwrite(spy(transformationMatrix), 'Q5b.jpg');

% Display Original and Shifted Image
figure(1)
subplot(121)
imagesc(uint8(originalImage))
title('Original Image')

subplot(122)
imagesc(uint8(imageDouble))
title('Shifted Image (306 pixels right, 230 pixels up)')

% Display the transformation matrix
figure(2)
subplot(121)
spy(transformationMatrixhorizontal)
title('Transformation Matrix Horizontal')

subplot(122)
spy(transformationMatrixvertical)
title('Transformation Matrix Vertical')