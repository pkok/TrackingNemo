function k = epanechnikov_kernel(width,height, c, d)
%Create 2D matric for kernel
k=zeros(height,width);

%Set width and height range for x
hV=-1:2/height:1;
wV=-1:2/width:1;

for h=1:height
	for w=1:width
        %calculate x distance
		x=sqrt(hV(h)^2+wV(w)^2);
		if x<=1
            %calculate kernel value if x is less than 1
			k(h,w)=(1/2)*(c^-1)*(d+2)*(1-abs(x)^4);
        else
            %else just make it 0
			k(h,w)=0;
        end
	end
end

%Normalize kernel to 0-1
k=k/sum(sum(k));