function H = ImgHistKernel(img,kernel,bins)

    img=imresize(img,[size(kernel,1),size(kernel,2)]);

    img = (img + abs(min(img(:)))) / (abs(min(img(:))) + max(img(:)));
    img = img*255;
    img = img+1;

    if bins==3
        H=zeros(16,16,16);
        B1=ceil(double(img(:,:,1))/16);
        B2=ceil(double(img(:,:,2))/16);
        B3=ceil(double(img(:,:,3))/16);
        for h=1:size(img,1)
            for w=1:size(img,2)
                H(B1(h,w),B2(h,w),B3(h,w)) = H(B1(h,w),B2(h,w),B3(h,w))+kernel(h,w);
            end
        end
    elseif bins==2
        H=zeros(16,16);
        B1=ceil(double(img(:,:,1))/16);
        B2=ceil(double(img(:,:,2))/16);
        for h=1:size(img,1)
            for w=1:size(img,2)
                H(B1(h,w),B2(h,w)) = H(B1(h,w),B2(h,w))+kernel(h,w);
            end
        end
    elseif bins==1
        H=zeros(16);
        B1=ceil(double(img(:,:,1))/16);
        for h=1:size(img,1)
            for w=1:size(img,2)
                H(B1(h,w)) = H(B1(h,w))+kernel(h,w);
            end
        end
    end
end