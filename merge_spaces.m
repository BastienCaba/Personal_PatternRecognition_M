function out = merge_spaces(subspace1, subspace2)
%% This function merges two eigenspaces (incremental PCA)
out = struct('mean', [], 'size', 0, 'eig_vec', u, 'eig_val', val);
out.size = subspace1.size + subspace2.size;
out.mean = (subspace1.size * subspace1.mean + subspace2.size * subspace2.mean)/out.size;
end