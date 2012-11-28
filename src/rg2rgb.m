function rgb_img = rg2rgb(img)
rgb_img = zeros(size(img, 1), size(img, 2), 3)
rgb_img(:,:,1) = img(:,:,1)
rgb_img(:,:,2) = img(:,:,2)
rgb_img(:,:,3) = 1 - img(:,:,1) - img(:,:,2)

end
