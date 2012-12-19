function B=Get_Cand_Weights(img,obj)
	
%candImg = (candImg + abs(min(candImg(:)))) / (abs(min(candImg(:))) + max(candImg(:)));
%candImg = candImg*255;
%candImg = candImg+1;
%    
%	W=zeros(size(candImg,1),size(candImg,2));
%
%	for r=1:size(candImg,1)
%		for c=size(candImg,2)
%			v=ceil(double(candImg(r,c,:))/16);
%			W(r,c)=mHist(v(1),v(2),v(3));
%		end
%	end
%end
	bin=16;
	img = (img + abs(min(img(:)))) / (abs(min(img(:))) + max(img(:)));
	img = img*255;
	img = img+1;

    B = zeros(size(img,1),size(img,2));
    binsize = 256/bin;
    bin1 = ceil(double(img(:,:,1))/binsize);
    bin2 = ceil(double(img(:,:,2))/binsize);
    bin3 = ceil(double(img(:,:,3))/binsize);
    
			for i=1:size(img,1)
				for j=1:size(img,2)
					B(i,j) = obj(bin1(i,j),bin2(i,j),bin3(i,j));
				end
			end
end