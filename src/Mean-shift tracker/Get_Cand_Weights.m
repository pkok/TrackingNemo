function W=Get_Cand_Weights(img,obj,bins)
    img = (img + abs(min(img(:)))) / (abs(min(img(:))) + max(img(:)));
    img = img*255;
    img = img+1;
    W=zeros(size(img,1),size(img,2));
    
    if bins==3
        B1=ceil(double(img(:,:,1))/16);
        B2=ceil(double(img(:,:,2))/16);
        B3=ceil(double(img(:,:,3))/16);
        for i=1:size(img,1)
            for j=1:size(img,2)
                W(i,j) = obj(B1(i,j),B2(i,j),B3(i,j));
            end
        end
    elseif bins==2
        B1=ceil(double(img(:,:,1))/16);
        B2=ceil(double(img(:,:,2))/16);
        for i=1:size(img,1)
            for j=1:size(img,2)
                W(i,j) = obj(B1(i,j),B2(i,j));
            end
        end
    elseif bins==1
        B1=ceil(double(img(:,:,1))/16);
        for i=1:size(img,1)
            for j=1:size(img,2)
                W(i,j) = obj(B1(i,j));
            end
        end
    end
end