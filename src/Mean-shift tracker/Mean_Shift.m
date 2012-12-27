function newCenter = Mean_Shift(objHist,img,center,width,height,kernel,bins)
	iter=1;
	while 1
		row=center(2)-height/2;
		col=center(1)-width/2;
		candImg=img(row:row+height-1,col:col+width-1,:);
		candHist=ImgHistKernel(candImg,kernel,bins);
		
		mHist=sqrt(objHist./candHist);
		mHist(isnan(mHist))=0;
		mHist(isinf(mHist))=0;
		
		weights=Get_Cand_Weights(candImg,mHist,bins);

		sumWeights=sum(sum(weights));
		
		searchWindow = ([size(weights,1)/2,size(weights,2)/2]);
		
		newCenter = [0 0];
		for i=1 : height
			for j=1 : width
				pos = [j-searchWindow(2) i-searchWindow(1)]-0.5;
				newCenter = newCenter + (pos.*weights(i,j));
			end
		end
		
		%shift=round(newCenter/sumWeights);
		
		if sumWeights > 0
			newCenter = round((newCenter / sumWeights) + center); %y1
		else
			newCenter = center;
        end
        
        if newCenter(2)+height/2>size(img,1) || newCenter(1)+width/2>size(img,2)...
                || newCenter(2)-height/2<0 || newCenter(1)-width/2<0
            newCenter=center;
        end
		
		if norm(newCenter - center) > 0 && iter < 20
			center = newCenter;
			iter = iter + 1;
		else 
			break;
		end
	end
end