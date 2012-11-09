function dist = distB(v1, v2)
dist = sum(sqrt(v1 .* v2));
while max(size(dist)) ~= 1
    dist = sum(dist);
end
dist = sqrt(1 - dist);