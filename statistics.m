clear; clc; close all;

% Load the dataset
data = readtable('data_0_0.txt');
data_astar = readtable('data_compare_astar.txt');

% Extract the relevant dependent variables
algorithm_values = data.Var5;
units_traveled_algorithm_1 = data.Var1(algorithm_values == 1);
units_traveled_algorithm_2 = data.Var1(algorithm_values == 2);
units_traveled_algorithm_3 = data.Var1(algorithm_values == 3);

algorithm_values_astardata = data_astar.Var5;
units_traveled_algorithm_4 = data_astar.Var1(algorithm_values_astardata == 4);
units_traveled_algorithm_5 = data_astar.Var1(algorithm_values_astardata == 5);


time_algorithm_1 = data.Var4(algorithm_values == 1);
time_algorithm_2 = data.Var4(algorithm_values == 2);
time_algorithm_3 = data.Var4(algorithm_values == 3);
time_algorithm_4 = data_astar.Var4(algorithm_values_astardata == 4);
time_algorithm_5 = data_astar.Var4(algorithm_values_astardata == 5);


error_algorithm_1 = data.Var2(algorithm_values == 1);
error_algorithm_2 = data.Var2(algorithm_values == 2);
error_algorithm_3 = data.Var2(algorithm_values == 3);
error_algorithm_4 = data_astar.Var2(algorithm_values_astardata == 4);
error_algorithm_5 = data_astar.Var2(algorithm_values_astardata == 5);

rotation_algorithm_1 = data.Var3(algorithm_values == 1);
rotation_algorithm_2 = data.Var3(algorithm_values == 2);
rotation_algorithm_3 = data.Var3(algorithm_values == 3);
rotation_algorithm_4 = data_astar.Var3(algorithm_values_astardata == 4);
rotation_algorithm_5 = data_astar.Var3(algorithm_values_astardata == 5);

map_values = data.Var6;
map_values_astardata = data_astar.Var6;
rotation_algorithm_1_map_1 = data.Var3(algorithm_values == 1 & map_values == 1);
rotation_algorithm_2_map_1 = data.Var3(algorithm_values == 2 & map_values == 1);
rotation_algorithm_3_map_1 = data.Var3(algorithm_values == 3 & map_values == 1);
rotation_algorithm_4_map_1 = data_astar.Var3(algorithm_values_astardata == 4 & map_values_astardata == 1);
rotation_algorithm_5_map_1 = data_astar.Var3(algorithm_values_astardata == 5 & map_values_astardata == 1);

rotation_algorithm_1_map_2 = data.Var3(algorithm_values == 1 & map_values == 2);
rotation_algorithm_2_map_2 = data.Var3(algorithm_values == 2 & map_values == 2);
rotation_algorithm_3_map_2 = data.Var3(algorithm_values == 3 & map_values == 2);
rotation_algorithm_4_map_2 = data_astar.Var3(algorithm_values_astardata == 4 & map_values_astardata == 2);
rotation_algorithm_5_map_2 = data_astar.Var3(algorithm_values_astardata == 5 & map_values_astardata == 2);

rotation_algorithm_1_map_3 = data.Var3(algorithm_values == 1 & map_values == 3);
rotation_algorithm_2_map_3 = data.Var3(algorithm_values == 2 & map_values == 3);
rotation_algorithm_3_map_3 = data.Var3(algorithm_values == 3 & map_values == 3);
rotation_algorithm_4_map_3 = data_astar.Var3(algorithm_values_astardata == 4 & map_values_astardata == 3);
rotation_algorithm_5_map_3 = data_astar.Var3(algorithm_values_astardata == 5 & map_values_astardata == 3);

rotation_algorithm_1_map_4 = data.Var3(algorithm_values == 1 & map_values == 4);
rotation_algorithm_2_map_4 = data.Var3(algorithm_values == 2 & map_values == 4);
rotation_algorithm_3_map_4 = data.Var3(algorithm_values == 3 & map_values == 4);
rotation_algorithm_4_map_4 = data_astar.Var3(algorithm_values_astardata == 4 & map_values_astardata == 4);
rotation_algorithm_5_map_4 = data_astar.Var3(algorithm_values_astardata == 5 & map_values_astardata == 4);

rotation_algorithm_1_map_5 = data.Var3(algorithm_values == 1 & map_values == 5);
rotation_algorithm_2_map_5 = data.Var3(algorithm_values == 2 & map_values == 5);
rotation_algorithm_3_map_5 = data.Var3(algorithm_values == 3 & map_values == 5);
rotation_algorithm_4_map_5 = data_astar.Var3(algorithm_values_astardata == 4 & map_values_astardata == 5);
rotation_algorithm_5_map_5 = data_astar.Var3(algorithm_values_astardata == 5 & map_values_astardata == 5);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Descriptive analysis
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

disp('Descriptive Statistics for Algorithm 1 - units traveled:');
disp(['Mean: ', num2str(mean(units_traveled_algorithm_1))]);
disp(['Standard Deviation: ', num2str(std(units_traveled_algorithm_1))]);

disp('Descriptive Statistics for Algorithm 2 - units traveled:');
disp(['Mean: ', num2str(mean(units_traveled_algorithm_2))]);
disp(['Standard Deviation: ', num2str(std(units_traveled_algorithm_2))]);

disp('Descriptive Statistics for Algorithm 3 - units traveled:');
disp(['Mean: ', num2str(mean(units_traveled_algorithm_3))]);
disp(['Standard Deviation: ', num2str(std(units_traveled_algorithm_3))]);

disp('Descriptive Statistics for Algorithm 4 - units traveled:');
disp(['Mean: ', num2str(mean(units_traveled_algorithm_4))]);
disp(['Standard Deviation: ', num2str(std(units_traveled_algorithm_4))]);

disp('Descriptive Statistics for Algorithm 5 - units traveled:');
disp(['Mean: ', num2str(mean(units_traveled_algorithm_5))]);
disp(['Standard Deviation: ', num2str(std(units_traveled_algorithm_5))]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Visualization
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% % Scatterplot
% figure;
% plotmatrix(units_traveled_algorithm_1, units_traveled_algorithm_2);
% xlabel('Random');
% ylabel('SemiRandom');
% title('Scatterplot: Random vs. SemiRandom');
% 
% 
% % Create boxplots for time_taken
% figure;
% subplot(2, 1, 1);
% boxplot([time_algorithm_1, time_algorithm_2, time_algorithm_3, time_algorithm_4, time_algorithm_5], ...
%     'Labels', {'Algorithm 1', 'Algorithm 2', 'Algorithm 3', 'Algorithm 4', 'Algorithm 5'});
% ylabel('Time Taken');
% title('Boxplot of Time Taken for Different Algorithms');
% 
% 
% % Create boxplots for units_traveled
% subplot(2, 1, 2);
% boxplot([units_traveled_algorithm_1, units_traveled_algorithm_2, units_traveled_algorithm_3, units_traveled_algorithm_4, units_traveled_algorithm_5], ...
%     'Labels', {'Algorithm 1', 'Algorithm 2', 'Algorithm 3', 'Algorithm 4', 'Algorithm 5'});
% ylabel('Units Traveled');
% title('Boxplot of Units Traveled for Different Algorithms');
% 
% 
% % Create boxplots for time
% figure;
% subplot(2, 1, 1);
% boxplot([time_algorithm_4, time_algorithm_5], ...
%     'Labels', {'Algorithm 4', 'Algorithm 5'});
% ylabel('Time Taken');
% title('Boxplot of Time Taken for Different Algorithms');
% 
% % Create boxplots for error
% figure;
% subplot(2, 1, 1);
% boxplot([error_algorithm_4, error_algorithm_5], ...
%     'Labels', {'Algorithm 4', 'Algorithm 5'});
% ylabel('Time Taken');
% title('Boxplot of Time Taken for Different Algorithms');

disp('Correlation time and rotation:')
disp(corr(time_algorithm_5, rotation_algorithm_5));
disp(corr(time_algorithm_5, error_algorithm_5));
disp(corr(error_algorithm_5, rotation_algorithm_5));
disp(corr(error_algorithm_5, units_traveled_algorithm_5));
disp(corr(time_algorithm_5, units_traveled_algorithm_5));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Check for normal distribution
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Create Q-Q plots for time variables
figure;
subplot(3, 2, 1);
qqplot(time_algorithm_1);
title('Q-Q Plot - Time Algorithm 1');

subplot(3, 2, 2);
qqplot(time_algorithm_2);
title('Q-Q Plot - Time Algorithm 2');

subplot(3, 2, 3);
qqplot(time_algorithm_3);
title('Q-Q Plot - Time Algorithm 3');

subplot(3, 2, 4);
qqplot(time_algorithm_4);
title('Q-Q Plot - Time Algorithm 4');

subplot(3, 2, 5);
qqplot(time_algorithm_5);
title('Q-Q Plot - Time Algorithm 5');

% Create Q-Q plots for error variables
figure;
subplot(3, 2, 1);
qqplot(error_algorithm_1);
title('Q-Q Plot - Error Algorithm 1');

subplot(3, 2, 2);
qqplot(error_algorithm_2);
title('Q-Q Plot - Error Algorithm 2');

subplot(3, 2, 3);
qqplot(error_algorithm_3);
title('Q-Q Plot - Error Algorithm 3');

subplot(3, 2, 4);
qqplot(error_algorithm_4);
title('Q-Q Plot - Error Algorithm 4');

subplot(3, 2, 5);
qqplot(error_algorithm_5);
title('Q-Q Plot - Error Algorithm 5');

% Create Q-Q plots for rotation variables
figure;
subplot(3, 2, 1);
qqplot(rotation_algorithm_1);
title('Q-Q Plot - Rotation Algorithm 1');

subplot(3, 2, 2);
qqplot(rotation_algorithm_2);
title('Q-Q Plot - Rotation Algorithm 2');

subplot(3, 2, 3);
qqplot(rotation_algorithm_3);
title('Q-Q Plot - Rotation Algorithm 3');

subplot(3, 2, 4);
qqplot(rotation_algorithm_4);
title('Q-Q Plot - Rotation Algorithm 4');

subplot(3, 2, 5);
qqplot(rotation_algorithm_5);
title('Q-Q Plot - Rotation Algorithm 5');



figure;
subplot(3, 2, 1);
qqplot(rotation_algorithm_1_map_1);
title('Q-Q Plot - Rotation Algorithm 1');

subplot(3, 2, 2);
qqplot(rotation_algorithm_2_map_1);
title('Q-Q Plot - Rotation Algorithm 2');

subplot(3, 2, 3);
qqplot(rotation_algorithm_3_map_1);
title('Q-Q Plot - Rotation Algorithm 3');

subplot(3, 2, 4);
qqplot(rotation_algorithm_4_map_1);
title('Q-Q Plot - Rotation Algorithm 4');

subplot(3, 2, 5);
qqplot(rotation_algorithm_5_map_1);
title('Q-Q Plot - Rotation Algorithm 5');

% Test for normal distribution
[h, p] = adtest(rotation_algorithm_1_map_1);
disp(p);
[h, p] = adtest(rotation_algorithm_2_map_1);
disp(p);
[h, p] = adtest(rotation_algorithm_3_map_1);
disp(p);
[h, p] = adtest(rotation_algorithm_4_map_1);
disp(p);
[h, p] = adtest(rotation_algorithm_5_map_1);
disp(p);

[h, p] = lillietest(rotation_algorithm_1_map_1);
disp(p);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Check for equal variances
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[h_var, p_var] = vartest2(error_algorithm_3, error_algorithm_4);
disp(h_var);
[h_var, p_var] = vartest2(error_algorithm_3, error_algorithm_5);
disp(h_var);
[h_var, p_var] = vartest2(time_algorithm_3, time_algorithm_4);
disp(h_var);
[h_var, p_var] = vartest2(time_algorithm_3, time_algorithm_5);
disp(h_var);
[h_var, p_var] = vartest2(rotation_algorithm_3, rotation_algorithm_4);
disp(h_var);
[h_var, p_var] = vartest2(rotation_algorithm_3, rotation_algorithm_5);
disp(h_var);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Test statistics (Mann-Whitney U test)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Assuming independence
% Model checking shows no normal distribution
% Algorithm 1: Random
% Algorithm 2: Semi-Random
% Algorithm 3: A* Random
% Algorithm 4: A* Orientation
% Algorithm 5: A* Sequential


% Combine data into a cell array
time_data = {time_algorithm_1, time_algorithm_2, time_algorithm_3, time_algorithm_4, time_algorithm_5};
error_data = {error_algorithm_1, error_algorithm_2, error_algorithm_3, error_algorithm_4, error_algorithm_5};
rotation_data = {rotation_algorithm_1, rotation_algorithm_2, rotation_algorithm_3, rotation_algorithm_4, rotation_algorithm_5};

% Number of tests
num_tests = 10;
num_algorithms = 5;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Correction for Type 1 error %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Bonferroni correction
alpha = 0.05;
alpha_corrected = alpha / num_tests;

% Display the corrected significance level
fprintf('Corrected significance level: %f\n', alpha_corrected);

% Initialize matrices to store p-values
p_values_time = nan(num_algorithms);
p_values_error = nan(num_algorithms);
p_values_rotation = nan(num_algorithms);

% Perform Mann-Whitney U tests for all combinations
for i = 1:(num_algorithms-1)
    for j = (i + 1):num_algorithms
        % Perform Mann-Whitney U test for time
        [p_values_time(i, j), ~, ~] = ranksum(time_data{i}, time_data{j});
        
        % Perform Mann-Whitney U test for error
        [p_values_error(i, j), ~, ~] = ranksum(error_data{i}, error_data{j});
        
        % Perform Mann-Whitney U test for rotation
        [p_values_rotation(i, j), ~, ~] = ranksum(rotation_data{i}, rotation_data{j});
    end
end

format short g;

% Display the matrix of p-values
disp('Matrix of Mann-Whitney U test p-values: time');
disp(p_values_time);

disp('Matrix of Mann-Whitney U test p-values: error');
disp(p_values_error);

disp('Matrix of Mann-Whitney U test p-values: rotation');
disp(p_values_rotation);

% Compare p-values against the corrected significance level
significant_time = p_values_time < alpha_corrected;
significant_error = p_values_error < alpha_corrected;
significant_rotation = p_values_rotation < alpha_corrected;

% Display significant results
disp('Significant results for time:');
disp(significant_time);

disp('Significant results for error:');
disp(significant_error);

disp('Significant results for rotation:');
disp(significant_rotation);