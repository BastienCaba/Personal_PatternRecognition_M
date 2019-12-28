function imcomp(u, v)
%% This function displays on a figure two images and their difference
subplot(1,2,1); imagesc(reshape(u, [56, 46])); axis image; colormap(gray);
subplot(1,2,2); imagesc(reshape(v, [56, 46])); axis image; colormap(gray);
end