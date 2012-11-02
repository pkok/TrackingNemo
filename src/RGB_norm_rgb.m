function RGB_norm_rgb( img )
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

img(:,:,1)=rNormal(:,:);
img(:,:,2)=gNormal(:,:);
img(:,:,3)=bNormal(:,:);

%Normalized image
figure(1);
imshow(img);

%Normalized image Red histogram
figure(2);
imhist(img(:,:,1),256);
xlabel('Red intensity');
ylabel('No. of Pixels');

%normalized image Green histogram
figure(3);
imhist(img(:,:,2),256);
xlabel('Green intensity');
ylabel('No. of Pixels');

%Normalized image Blue histogram
figure(4);
imhist(img(:,:,3),256);
xlabel('Blue intensity');
ylabel('No. of Pixels');

end
 
