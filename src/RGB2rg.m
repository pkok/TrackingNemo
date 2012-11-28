function rg_img = RGB2rg(img)
%get image of each color dimension
img=im2double(img);
R=img(:,:,1);
G=img(:,:,2);
B=img(:,:,3);

%in case a pure black picture
div=(sqrt(R(:,:).^2 + G(:,:).^2 + B(:,:).^2));
indx=div==0;
div(indx)=0.0001;

%normalise each color
rNormal=R(:,:)./(div);
gNormal=G(:,:)./(div);
bNormal=B(:,:)./(div);

rg_img = zeros(size(rNormal, 1), size(rNormal, 2), 2);
rg_img(:,:,1) = rNormal; 
rg_img(:,:,2) = gNormal;
