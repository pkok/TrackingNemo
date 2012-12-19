function H = ImgHistKernel(img,width,height,kernel)

img = (img + abs(min(img(:)))) / (abs(min(img(:))) + max(img(:)));
img = img*255;
img = img+1;

H=zeros(16,16,16);

for h=1:height
    for w=1:width
        v = ceil(double(img(h,w,:))/16);
        H(v(1),v(2),v(3)) = H(v(1),v(2),v(3))+kernel(h,w);
    end
end
end