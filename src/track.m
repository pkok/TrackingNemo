function [minW minH] = track(sB,obj)
%---create object histogram
objHist=rgbhist(obj);

%---set matrix to story all euclidean distances in search box. not
%necessary by nice to have in the long run
euclDistMat=zeros(size(sB,1)-size(obj,1), size(sB,2)-size(obj,2));

%---set an arbitrarily high min distance value
minDist=999999999;

%---iterate through all pixels in search box. should be changed to
%euclDistMat sizes in case we dont use the matrix
for h=1:size(euclDistMat,1)
    for w=1:size(euclDistMat,2)
        %---set parser region in search box to compare object with
        prsr=sB(h:h+size(obj,1), w:w+size(obj,2),:);
        %figure(5),imshow(prsr);
        %rectangle('Position',[w h size(obj,2) size(obj,1)], 'LineWidth',1, 'EdgeColor','b');
  
        %---create histogram of parser to compare with object histogram.
        %can be made much faster by normalising RGB and computing histogram
        %on only 2D taking r and g as b=1-r+g...so...yeah
        prsrHist=rgbhist(prsr);
        
        %---find euclidean distance between parser and object histograms
        euclDistMat(h,w)=euclidianDist(prsrHist,objHist);
        
        %---check for min distance and set min row and column values of
        %object min distance from search box
        if euclDistMat(h,w)<minDist
            minDist=euclDistMat(h,w);
            minH=h;
            minW=w;
        end
    end
end

end