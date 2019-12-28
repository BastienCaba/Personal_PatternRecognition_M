function [v, val] = nPCA(data)
%% This function performs naive PCA on data
disp("Naive PCA will now begin...");

N = size(data, 2);          %Number of ex. in data
mu_face = mean(data, 2);    %Mean face across complete dataset

A = data - mu_face;                 %Normalised data (deviation from mean)
S = (1/N)*A*A.';                    %Covariance matrix
[v,D] = eig(S); val = diag(D);      %Eigendecomposition

disp("Complete!");
end