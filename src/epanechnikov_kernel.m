function img = epanechnikov_kernel(height, width, c, d)
img = zeros(height, width);

c_h = height / 2;
c_w = width / 2;
maxdist = sqrt((c_h * c_h) + (c_w * c_w));

for h=1:height
  for w=1:width
    x = (maxdist - sqrt((h - c_h) * (h - c_h) + (w - c_w) * (w - c_w))) / maxdist;
    img(h, w) = (d + 2) / (2 * c) * x;
  end
end

end
