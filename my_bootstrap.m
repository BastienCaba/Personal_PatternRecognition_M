function new_datasets = my_bootstrap(dataset, L)
%% This function creates L articifial datasets from the original dataset via bootstrapping
[num_feat, N] = size(dataset);          %Number of features in each datapoint, number of datapoints
new_datasets = zeros(num_feat, N, L);   %Tensor containing new datasets

for i = 1:L
    for j = 1:N
        r = randi(1,N);
        new_datasets(:,N,L) = dataset(:,r);
    end
end
end