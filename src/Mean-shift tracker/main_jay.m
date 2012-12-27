function main_jay()
    close all;
    clc;
    
    CS=2;
    bins=2;
    %---Get and Set Object parameters from first image
    %Load images dir
    path='bicycle/';
    D=dir('bicycle/*.jpg');

    %Show first image to choose object to track
    img=imread(strcat(path,D(1).name));
    
    if CS==1
        img=RGB2rgb(img);
    elseif CS==2
        img=RGB2HSI(img);
    end
    
    figure(1);
    imshow(img,[]);
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
    sizex=51;
    sizey=51;
    %Get kernel
    kernel=epanechnikov_kernel(sizex,sizey,c,d);

    %Show kernel (illustrative purposes)
    % figure(2);
    % surf(kernel);
    %----------------------------------------------------------

    %---Get 16x16x16 histogram of object based on kernel
    objHist=ImgHistKernel(obj,kernel,bins);
    %----------------------------------------------------------
    
    tLine=zeros(1,2);
    tLine(1,:)=center;
    time=zeros(numel(D));
    
    %---RELEASE THE (TRACK)EN!
    for i=1:numel(D)
        tic;
        fprintf('Processing %s\n', D(i).name)
        %Load the candidate image
        candImg=imread(strcat(path,D(i).name));
        origImg=candImg;
        
        if CS==1
            candImg=RGB2rgb(candImg);
        elseif CS==2
            candImg=RGB2HSI(candImg);
        end
    
        %Get new center of object
        center = Mean_Shift(objHist,candImg,center,width,height,kernel,bins);
        tLine(i,:)=center;
        %Show image with tracked object
        figure(3);
        imshow(origImg,[]);
        hold on;
        h = rectangle('Position', [center - [width/2 height/2] [width height]]);
        set(h, 'EdgeColor', [1 0 0]);
        plot(center(1),center(2),'g*');
        plot(tLine(:,1),tLine(:,2),'r');
        hold off;
        time(i)=toc;
    end
    figure(4);
    xlabel('Frames');
    ylabel('Seconds');
    plot(time);
end
