function Img=RGB2HSI(img)
	img = im2double(img);
	D = size(img);
	R = img(:,:,1); %R=R(:);
	G = img(:,:,2); %G=G(:);
	B = img(:,:,3); %B=B(:);

	MinRG=min(R,G);
	MinGB=min(G,B);
	MinRGB=min(MinRG,MinGB);

	hue=atan((sqrt(3.0)*(G-B))./((R-G)+(R-B)));
	saturation=1.0-(3.0*MinRGB);
	intesity=(R+G+B)*(1/3);

	hue=reshape(hue,D(1:2));
	saturation=reshape(saturation,D(1:2));
	intesity=reshape(intesity,D(1:2));

	Img=cat(3,hue,saturation,intesity);
	Img=(Img+abs(min(Img(:))))/(max(Img(:))+abs(min(Img(:))));
	Img(isnan(Img)) = 0;
end