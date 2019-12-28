function err = coldiff(A,B)
%% Returns the Frobenius norm of each column of the difference btwn two matrices
Ncol = size(A,2);           %Number of columns in matrices
d = A-B;                    %Difference btwn matrices
err = zeros(1,Ncol);        %Frobenius norm of column-wise difference
for i = 1:Ncol
    err(i) = norm(d(:,i), 'fro');
end
end