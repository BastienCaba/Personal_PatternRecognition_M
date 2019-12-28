function data_rec = reconstruct(data, subspace, mu_face)
%% This function reconstructs original vec. from compressed version (lossy, non-ideal reconstr.)
basis = subspace.u;                 %Basis vectors spanning subspace
M = subspace.M;                     %Dimensionality of subspace
N = size(data, 2);                  %Number of vectors to be reconstructed
data_rec = zeros(length(mu_face), N);   %Reconstructed data

disp("Data is being reconstructed (non-ideal reconstruction)...");

for n = 1:N                         %Iterate over vectors from data
    for i = 1:M                     %Iterate over 
        data_rec(:,n) =+ data_rec(:,n) + data(i,n)*basis(:,i);
    end
    data_rec(:,n) = data_rec(:,n) + mu_face;       %Add mean
    %Rescale data to fit original range
    data_rec(:,n) = rescale(data_rec(:,n), 0, 256);
end

disp("Complete!");
end