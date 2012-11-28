function histRGB = rgbhist(img_path)

%RGBHIST Histogram of RGB values.
%img=floor(imread(img_path)/16)+1;
img=floor(img_path/16)+1;

if (size(img, 3) ~= 3)
    error('rgbhist:numberOfSamples', 'Input image must be RGB.')
end

histRGB=zeros(17,17,17);

for h=1:size(img,1)
    for w=1:size(img,2)
        v = img(h,w,:);
        histRGB(v(1),v(2),v(3)) = histRGB(v(1),v(2),v(3))+1;
    end
end
end