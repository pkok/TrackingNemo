function dist=distE(v1, v2)
dist = (v1 - v2)^2;
while max(size(dist)) ~= 1:
    dist = sum(dist);
end
dist = sqrt(dist);