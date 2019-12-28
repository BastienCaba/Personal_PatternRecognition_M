function lookat_basis(eigvec)
%% This function displays information about the PCA low-dim subspace
N = 10;     %Only N first basis images will be shown (ordered by eigenvalue weight)

flag_vec = input("Do you wish to visualise " + N + " first PCA basis images (0:NO, 1:YES)? >> ");
if flag_vec == 1
    figure; title("Sample of the " + int2str(N) + " Basis Images with Largest Eigenvalue.");
    for i = 1:N
        subplot(2,5,i); vec2im(eigvec(:,i));
    end
end
end