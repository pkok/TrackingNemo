function track_bruteForce()
%---load all images into a struct
D=dir(strcat(pwd ,'\MoreFrames_part_1\part_1\*.png'));
imcell = cell(1,numel(D));
for i = 1:numel(D)
  imcell{i} = imread(strcat(pwd ,'\MoreFrames_part_1\part_1\',D(i).name));
end

%---Get the object window's coordinates from the user
figure(1);
imshow(imcell{1});
[x, y] = ginput(2);
%x = sort(x);
%y = sort(y);
%---draw box around selected points
draw_box(1, x, y);

%---set cropped image as object
obj=imcell{1}(y(1):y(2),x(1):x(2),:);
sx=size(obj,1);
sy=size(obj,2);
%figure (2), imshow (obj);

%---set size of searchwindow+object window
m=10;
searchBox=imcell{1}(y(1)-m : y(2)+m , x(1)-m : x(2)+m , :);
%figure(3), imshow(searchBox);

for i=1:numel(imcell)
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
    
    %---tried to update change in object but doesnt work. can be fixed given
    %object flow/direction heuristic
    %obj=imcell{i}(y(1):y(2),x(1):x(2),:);
    %figure (2), imshow (obj);
    
    %---update location of search box
    searchBox=imcell{i}(y(1)-m : y(2)+m , x(1)-m : x(2)+m , :);
    %figure(3), imshow(searchBox);
    
    figure(10);
    imshow (imcell{i});
    draw_box(10, x, y);
end
end