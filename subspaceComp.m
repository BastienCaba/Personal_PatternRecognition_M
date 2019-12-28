function [vec_err, valcheck] = subspaceComp(subspace1, subspace2)
%% This function compares two PCA-derived subspaces
%Comparing basis images
u1 = subspace1.u;
u2 = subspace2.u;
D = size(u1,2);

vec_err = coldiff(u1,u2);   %Error between basis images

disp("Do you wish to visualize basis images?");
flag = input(" 0: NO\n 1: YES\n >> ");

if(flag == 1)
    sel = input("Please select basis image ID (1-" + num2str(D) + ") >> ");
    figure; title("Comparison of basis images with ID " + int2str(sel) + ", Total Error = " + num2str(vec_err(sel)));
    subplot(1,2,1); imagesc(reshape(u1(:,sel), [56, 46])); axis image; colormap(gray);
    subplot(1,2,2); imagesc(reshape(u2(:,sel), [56, 46])); axis image; colormap(gray);
end

%Comparing eigenvalues
val1 = subspace1.l;
val2 = subspace2.l;
valcheck = (sum(abs(val1 - val2)) == 0);

end