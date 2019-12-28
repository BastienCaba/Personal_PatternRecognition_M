function vec2im(v)
%% This function transforms raster vector to image and displays it
imagesc(reshape(v, [56, 46])); axis image; colormap(gray);
end