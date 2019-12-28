function label = classify_knn(traindata, testdata, eigenspace, k_param)
%% This function performs face recognition under KNN
disp("Nearest Neighbour classification will now begin...");

Ntr = size(traindata.X,2);      %Number of training examples
Nte = size(testdata.X,2);       %Number of testing examples

M = eigenspace.M;               %Dimensionality of subspace
basis = eigenspace.u;           %Basis vectors spanning subspace

tr_lowD = zeros(M, Ntr);        %Train data projected in low-dimensional subspace
te_lowD = zeros(M, Nte);        %Test data projected in low-dimensional subspace
label = zeros(1,Nte);           %Predicted labels of test ex.

%% Project training data on low-dimensional subspace
for i = 1:Ntr
    for j = 1:M
        tr_lowD(j,i) = transpose(traindata.X(:,i))*basis(:,j);
    end
end

%% Project testing data on subspace, then classify it
for i = 1:Nte                       %Iterate over testing examples
    %Projecting testing ex. on subspace
    for j = 1:M
        te_lowD(j,i) = testdata.X(:,i)'*basis(:,j);
    end
    %Computing distance (in subspace) of testing ex. to training ex.
    delta = zeros(1,Ntr);           %Distance between test ex. and every train ex.
    for k = 1:Ntr
        delta(k) = sum(abs(te_lowD(:,i)-tr_lowD(:,k)));
    end
    [deltaSort, idx] = sort(delta); %Sort from smallest distance to largest
    %Look at class of k-nearest neighbours
    neighbours = traindata.l(idx(1:k_param)); uniqneighbours = unique(neighbours);
    %Look at voting ratio (1/dist) of neighbours
    voteWeight = 1./deltaSort(1:k_param); vote = zeros(1,length(uniqneighbours));
    
    %For each unique class in neighbours, aggregate voting weights
    for m = 1:length(uniqneighbours)
        for p = 1:length(neighbours)
            if(neighbours(p) == uniqneighbours(m))
                vote(m) = vote(m) + voteWeight(p);
            end
        end
    end
    
    %Label attributed upon majority vote
    [~,idx_max] = max(vote); label(i) = neighbours(idx_max);
end

disp("Complete!");
end