function look_at(data)
%% This function allows to visually explore dataset
N = size(data.X,2);         %Number of examples in dataset
C = length(unique(data.l)); %Number of different classes in dataset
disp("The datsaset contains " + int2str(N) + " face images with " + int2str(N/C) + " examples for each one of the " + int2str(C) + " different face labels.");

disp("Do you wish to visualize your dataset?");
flag = input(" 0: NO\n 1: Label-based exploration\n 2: Show complete dataset\n >> ");

if flag == 2
    disp("The complete dataset will be shown...")
    for i = 1:N
        if(mod(i, 10) == 1)
            figure(data.l(i));
            title("Dataset for Class " + int2str(data.l(i)));
        end
        subplot(2, 5, mod(i,10)+1); vec2im(data.X(:,i));
    end
elseif flag == 1
    sel = input("Please select a class label (0-52) >> ");
    subsel = input("Please select an example from that class (0-10) >> ");
    sub_data = data.X(:,data.l == sel);
    subplot(1,2,1); mean_face = mean(sub_data, 2);
    vec2im(mean_face); title("Mean Face for Person of Class " + int2str(sel));
    subplot(1,2,2); vec2im(sub_data(:,subsel)); title("Sample Face " + int2str(subsel) + " for Person of Class " + int2str(sel));
end
end