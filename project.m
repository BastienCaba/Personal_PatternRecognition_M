function data_mod = project(data, subspace)
%% This function projects data upon subspace
M = subspace.M;             %Dimension of subspace
N = size(data, 2);          %Number of vectors to be projected
data_mod = zeros(M, N);     %Data projected on subspace

disp("Data is being projected onto subspace (lossy compression)...");

for n = 1:N         %Iterate over vectors to be projected
    for i = 1:M     %Iterate over basis vectors spanning subspace
        %Project original vector upon all basis vectors spanning subspace
        data_mod(i,n) = transpose(data(:,n))*subspace.u(:,i);
    end
end

disp("Complete!");
end