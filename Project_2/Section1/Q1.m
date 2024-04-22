X_int = imread('rectangle.jpg');
X_double = double(X_int);

% Manipulation Code
X_gray = X_double(:,:,1)/3.0 + X_double(:,:,2)/3.0 + X_double(:,:,3)/3.0;


% Write image to grayrectangle
imwrite(uint8(X_gray), 'grayrectangle.jpg');

imagelist = {X_int uint8(X_gray)};

montage(imagelist);