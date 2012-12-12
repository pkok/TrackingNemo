function H = ImgHistKernel(img,width,height,kernel)

img=floor(img/16)+1;

H=zeros(17,17,17);

for h=1:height
    for w=1:width
        v = img(h,w,:);
        H(v(1),v(2),v(3)) = H(v(1),v(2),v(3))+kernel(h,w);
    end
end
end