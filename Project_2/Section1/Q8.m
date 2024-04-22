originalImage = imread("rectangle.jpg");
imageDouble = double(originalImage);

% Extract dimensions from image
[rows, cols] = size(imageDouble);

% Create a new cols x rows sized matrix for the transpose
imageTransposed = zeros(1792,1080,3);

% Perform transpose and assignment to final matrix
imageTransposed(:,:,1) = imageDouble(:,:,1)';
imageTransposed(:,:,2) = imageDouble(:,:,2)';
imageTransposed(:,:,3) = imageDouble(:,:,3)';

% Cast and display image
out = uint8(imageTransposed);
imagesc(out);