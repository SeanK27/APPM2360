originalImage = imread("rectangle.jpg");
originalImagedouble = double(originalImage);

[rows, cols] = size(originalImagedouble(:,:,1));

% Create Identity Matrix
I = eye(rows);

for i = 1:rows/2
    temp = I(i, :);
    I(i, :) = I(rows - i + 1, :);
    I(rows - i + 1, :) = temp;
end

originalImagedouble(:,:,1) = I * originalImagedouble(:,:,1);
originalImagedouble(:,:,2) = I * originalImagedouble(:,:,2);
originalImagedouble(:,:,3) = I * originalImagedouble(:,:,3);

spy(I)

flippedImage = uint8(originalImagedouble);

%imagesc(flippedImage)