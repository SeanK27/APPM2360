% Read the original image
image = imread('rectangle.jpg');

% Get the dimensions of the original image
[m, n, ~] = size(image);

% Construct the identity matrix IR with appropriate dimensions
IR = eye(m, n + 306);

% Construct the transformation matrix by manipulating IR
transformation_matrix = IR(:, 307:end);

% Display the transformation matrix using spy()
spy(transformation_matrix);

% Apply the horizontal shift by matrix multiplication
shifted_image = double(image) .* double(transformation_matrix);

% Convert the shifted image back to uint8
shifted_image = uint8(shifted_image);

% Display the shifted image
imshow(shifted_image);
