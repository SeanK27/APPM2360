originalImage = imread("rectangle.jpg");
originalImagedouble = double(originalImage);

[rows, cols] = size(originalImage);

% Create Identity Matrix
I = eye(rows, cols);

for i = 1:rows/2
    temp = originalImagedouble(i, :);
    originalImagedouble(i, :) = originalImagedouble(rows - i + 1, :);
    originalImagedouble(rows - i + 1, :) = temp;
end

flippedImage = uint8(originalImagedouble);

imshow(flippedImage)