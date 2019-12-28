%% Import data, extract parameters, visualise
close all; clear all; clc;      %Environment reset
data = open("face.mat");        %Open datafile (face and labels)

[test, train] = test_train_split(data.X, data.l, 0.8);
N = size(train.X, 2);       %Dataset size (number of faces)
look_at(data);              %Visual description of dataset
mu_face = mean(data.X, 2);  %Mean face across complete dataset

%% Principal Component Analysis
[nBasis, nVal] = nPCA(train.X);     %Naive PCA
M = findM(nVal);                    %Subspace construction
eigenspace_naive = struct('u', nBasis(:,1:M), 'l', nVal(1:M), 'M', M);

[eBasis, eVal] = ePCA(train.X);     %Efficient PCA
eigenspace_efficient = struct('u', eBasis(:,1:M), 'l', eVal(1:M), 'M', M);
[vec_err, valcheck] = subspaceComp(eigenspace_naive, eigenspace_efficient);

%Compare execution time between naive and efficient PCA
%nf = @() nPCA(train.X); timeit(nf);     %Evaluates to approx. 8.3s
%ne = @() ePCA(train.X); timeit(ne);     %Evaluates to approx. 0.1s

%% K Nearest Neighbours
prediction = classify_knn(train, test, eigenspace_efficient, 1);
[accuracy, confmat] = perfEval(prediction, test.l);