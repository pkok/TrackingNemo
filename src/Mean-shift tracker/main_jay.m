function main_jay()
close all;
clc;

%---Get and Set Object parameters from first image
%Load images dir
path='soccer/';
D=dir('soccer/*.png');

%Show first image to choose object to track
img=imread(strcat(path,D(1).name));
figure(1);
imshow(img);
hold on;
%Get coordinates of object by selecting with mouse
[x,y] = ginput(2);

%Assign object parameters
row=y(1); %this is the y coordinate of cartesian system called row for matrix rows
col=x(1); %this is the x coordinate of cartesian system called col for matrix columns
width=abs(x(2)-x(1));
height=abs(y(2)-y(1));
center=[round(col+width/2) round(row+height/2)];

%Draw a box to highlight object
draw_box(1,x,y);

%Get selected object from image
obj=img(row:row+height-1,col:col+width-1,:);
%----------------------------------------------------------

%---Get Epanechnikov Kernel
%Set kernel parameters
d=2;
c=pi;
%Get kernel
kernel=epanechnikov_kernel(width,height,c,d);

%Show kernel (illustrative purposes)
% figure(2);
% surf(kernel);
%----------------------------------------------------------

%---Get 16x16x16 histogram of object based on kernel
objHist=ImgHistKernel(obj,width,height,kernel);
%----------------------------------------------------------

%---RELEASE THE TRACKING!
for i=1:numel(D)
    %Load the candidate image
    candImg=imread(strcat(path,D(i).name));

    %Get new center of object
    center = Mean_Shift(objHist,candImg,center,width,height,kernel);

    %Show image with tracked object
    figure(3);
    imshow(candImg);
    hold on;
    h = rectangle('Position', [center - [width/2 height/2] [width height]]);
    set(h, 'EdgeColor', [1 0 0]);
    hold off;
    drawnow;

end
lol=0;

end
