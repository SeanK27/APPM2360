% Read the image into MATLAB and store as a matrix of doubles
X_int = imread('square.jpg');
imageMatrix = double(X_int);

% Separate the image matrix into red, green, and blue color channels
redChannel = imageMatrix(:, :, 1);
greenChannel = imageMatrix(:, :, 2);
blueChannel = imageMatrix(:, :, 3);

% Generate the DST matrix
n = size(redChannel, 1);
DST_matrix = generate_DST_matrix(n);

% Perform the 2D Discrete Sine Transform (DST) on each color channel
redChannel_dst = DST_matrix * redChannel * DST_matrix;
greenChannel_dst = DST_matrix * greenChannel * DST_matrix;
blueChannel_dst = DST_matrix * blueChannel * DST_matrix;

% Delete less important (high-frequency) values in the transformed matrices
p = 0.12; % Adjust this value between 0 and 1 to control compression level
redChannel_dst = discard_high_frequencies_antidiagonal(redChannel_dst, p);
greenChannel_dst = discard_high_frequencies_antidiagonal(greenChannel_dst, p);
blueChannel_dst = discard_high_frequencies_antidiagonal(blueChannel_dst, p);

% Perform the inverse DST on each color channel
redChannel_idst = DST_matrix' * redChannel_dst * DST_matrix;
greenChannel_idst = DST_matrix' * greenChannel_dst * DST_matrix;
blueChannel_idst = DST_matrix' * blueChannel_dst * DST_matrix;

% Combine the transformed color channels into a single matrix
compressedImage = cat(3, redChannel_idst, greenChannel_idst, blueChannel_idst);

% Display or write the compressed image
imshow(uint8(compressedImage));
% or
imwrite(uint8(compressedImage), 'compressed_image.jpg');