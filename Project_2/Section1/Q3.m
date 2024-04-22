originalImage = imread('rectangle.jpg');
colorImage = double(originalImage);

colorImage(:,:,1) = colorImage(:,:,1) * 0;
colorImage(:,:,3) = colorImage(:,:,3) + 80;

montage({originalImage, uint8(colorImage)});

imwrite(uint8(colorImage), 'Q3colorTransform.jpg');