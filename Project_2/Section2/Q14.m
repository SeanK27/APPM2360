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
p = 0.2; % Adjust this value between 0 and 1 to control compression level
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
imwrite(compressedImage, 'compressed_image.jpg');



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

p_values = [0.5, 0.25, 0.1];
compression_ratios = zeros(size(p_values));

% Calculate uncompressed size
uncompressed_size = numel(redChannel_dst);

for i = 1:numel(p_values)
    p = p_values(i);
    
    % Discard high-frequency parts
    compressed_matrix = discard_high_frequencies_antidiagonal(redChannel_dst, p);
    
    % Count the number of non-zero entries for compressed size
    compressed_size = nnz(compressed_matrix);
    
    % Calculate the compression ratio
    compression_ratios(i) = uncompressed_size / compressed_size;
end

% Display the compression ratios
disp('Compression Ratios:');
disp(['p = 0.5: CR = ', num2str(compression_ratios(1))]);
disp(['p = 0.25: CR = ', num2str(compression_ratios(2))]);
disp(['p = 0.1: CR = ', num2str(compression_ratios(3))]);