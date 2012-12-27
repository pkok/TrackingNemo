function Img=RGB2rgb(img)
    img = im2double(img);
	
	R = img(:, :, 1);
	G = img(:, :, 2);
	B = img(:, :, 3);

	%% prevent NaN's and Inf's
	R = R + ones(size(R, 1), size(R, 2));
	G = G + ones(size(G, 1), size(G, 2));
	B = B + ones(size(B, 1), size(B, 2));
	S = R + G + B;

	Img(:, :, 1) = (R ./ S);
	Img(:, :, 2) = (G ./ S);
	Img(:, :, 3) = (B ./ S);
end