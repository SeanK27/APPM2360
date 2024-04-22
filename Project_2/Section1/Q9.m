originalImage = imread("rectangle.jpg");
imageDouble = double(originalImage);

[rows, cols] = size(imageDouble(:,:,1));

% Create Identity Matrix
I = eye(cols);

% Define Shift Amount
cropAmount = 100;

transformationMatrix = eye(cols);
transformationMatrix2 = eye(rows);


transformationMatrix(1:cropAmount, 1:cropAmount) = 0;
transformationMatrix2(1:cropAmount, 1:cropAmount) = 0;


transformationMatrix(cols-cropAmount:cols, cols-cropAmount:cols) = 0;
transformationMatrix2(rows-cropAmount:rows, rows-cropAmount:rows) = 0;

imageDouble(:,:,1) = imageDouble(:,:,1) * transformationMatrix;
imageDouble(:,:,2) = imageDouble(:,:,2) * transformationMatrix;
imageDouble(:,:,3) = imageDouble(:,:,3) * transformationMatrix;

imageDouble(:,:,1) = transformationMatrix2 * imageDouble(:,:,1);
imageDouble(:,:,2) = transformationMatrix2 * imageDouble(:,:,2);
imageDouble(:,:,3) = transformationMatrix2 * imageDouble(:,:,3);

imwrite(imageDouble, 'Q5a.jpg');

% Display Original and Shifted Image
figure(1)
subplot(121)
imagesc(uint8(originalImage))
title('Original Image')

subplot(122)
imagesc(uint8(imageDouble))
title('Cropped Image (100 pixels)')

% Display the transformation matrix
figure(2)
spy(transformationMatrix)
title('Transformation Matrix')