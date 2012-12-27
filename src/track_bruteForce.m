function track_bruteForce()
clc;
clear all;

%---load all images into a struct
path='bicycle/';
D=dir('bicycle/*.jpg');
img=imread(strcat(path,D(1).name));

%---Get the object window's coordinates from the user
figure(1);
imshow(img);
[x, y] = ginput(2);
%x = sort(x);
%y = sort(y);
%---draw box around selected points
draw_box(1, x, y);

%---set cropped image as object
obj=img(y(1):y(2),x(1):x(2),:);
sx=size(obj,1);
sy=size(obj,2);
%figure (2), imshow (obj);

%---set size of searchwindow+object window
m=10;
searchBox=img(y(1)-m : y(2)+m , x(1)-m : x(2)+m , :);
%figure(3), imshow(searchBox);

tLine=zeros(1,2);
time=zeros(numel(D));

for i=1:numel(D)
    tic;
    %---track object from searchbox and return min row and column of object
    %based on euclidean distance but, relative to search box, not global
    %coordinates. 
    [oy ox]=track(searchBox,obj);
    
    %---translate object box from location in searchbox to global image
    %coordinates
    x(1)=x(1)+(oy-m);
    y(1)=y(1)+(ox-m);
    x(2)=x(1)+sy;
    y(2)=y(1)+sx;
    
    Cimg=imread(strcat(path,D(i).name));
    
    %---update location of search box
    searchBox=Cimg(y(1)-m : y(2)+m , x(1)-m : x(2)+m , :);
    center=[round(mean(x(1)-m : x(2)+m)) round(mean((y(1)-m : y(2)+m)))];
    tLine(i,:)=center;
    %figure(3), imshow(searchBox);
    
    %figure(10);
    %imshow (Cimg);
    %hold on;
    %draw_box(10, x, y);
    %plot(tLine(:,1),tLine(:,2),'r');
    %hold off;
    time(i)=toc;
end
end