function [acc, C] = perfEval(predicted, actual)
%% This function evaluates classification performance
acc = sum(predicted == actual)/length(actual) * 100;
C = confusionmat(actual, predicted);
end