function M = findM(eigenval)
%% This function computes M for a given reconstruction error
disp("We wish to select the M basis images with largest eigenvalues.");
recon_err = input("Please select the maximum relative reconstruction error allowed >> ");

%Plotting reconstruction error against M
cum_vaf = nonzeros((sum(real(eigenval)) - cumsum(real(eigenval)))/sum(real(eigenval)));
figure; bar(cum_vaf); hold on; xlim=get(gca,'xlim'); plot(xlim,[recon_err recon_err]);
title('Reduction in Reconstruction Error as more Basis Images are taken into account'); 
xlabel('M'); ylabel('Relative Reconstruction Error'); grid on; grid minor;

M = length(nonzeros(cum_vaf > recon_err)); 
disp("We have defined a subspace of dimensionality M=" + int2str(M) + ", with " + num2str((1-recon_err)*100) + "% variance accounted for (VAF).");
end