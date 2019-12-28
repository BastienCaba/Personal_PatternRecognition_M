function [u, val] = ePCA(data)
%% This function performs efficient PCA on data
disp("Efficient PCA will now begin...");
N = size(data, 2);              %Number of ex. in data
mu_face = mean(data, 2);        %Mean face across complete dataset
u = zeros(size(data));          %Eigenvectors of covariance matrix

A = data - mu_face;                 %Normalised data (deviation from mean)

S = (1/N)*A'*A;                             %Covariance matrix
[v,D] = eig(S); val = diag(D);              %Eigendecomposition

%Eigenvectors transformation
for i = 1:size(v, 2)
    u(:,i) = A*v(:,i);
    u(:,i) = u(:,i)./norm(u(:,i));          %Normalisation
end

disp("Complete!");
end