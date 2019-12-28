function [test, train] = test_train_split(im_data, labels, tr_ratio)
%% This function separates the data class-wise in training and testings subsets
train = struct('X', [], 'l', []);   %Initialise training set
test = struct('X', [], 'l', []);    %Initialise testing set
uniq_labels = unique(labels);       %Unique labels in dataset

for i = 1:length(uniq_labels)                           %Iterate over unique labels
    classData = im_data(:,labels == uniq_labels(i));    %Extract data for each label
    N_train = round(tr_ratio * size(classData,2));      %No. training ex. to extract with this label
    r = zeros(N_train);                                 %Idx of ex. drawn for training set
    for j = 1:N_train
        randnum = randi(size(classData,2),1);           %Draw a new random index
        while(ismember(randnum, r))                     %Check if the ex. with this idx was ~ already drawn
            randnum = randi(size(classData,2),1);
        end
        r(j) = randnum;                                 %Append this random idx to list
        train.X = [train.X, classData(:,r(j))];         %Append new training ex. selected
        train.l = [train.l, uniq_labels(i)];            %Append class of trainign ex.
    end
    for k = 1:size(classData,2)
        if ~ismember(k,r)                               %All remaining examples become testing
            test.X = [test.X, classData(:,k)];          %Append testing examples
            test.l = [test.l, uniq_labels(i)];          %Append class of testing ex.
        end
    end
end
end