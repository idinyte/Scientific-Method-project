clear; clc; close all;

% Load the dataset
data = readtable('/home/jonas/university/Scientific_Methods/project/data_0_0.txt');
data_astar = readtable('/home/jonas/university/Scientific_Methods/project/data_compare_astar.txt');

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
% Test statistics (Wilcoxon signed-rank test and Mann-Whitney U test)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Compare algorithm 1-3 with each other: Paired data and not normally distributed: Wilcoxon signed-rank test
% Compare algorithm 4-5 with each other: Paired data and not normally distributed: Wilcoxon signed-rank test
% Compare algorithm 1-3 with 4-5: Not paired data and not normally distributed: Mann-Whitney U test

% Wilcoxon signed-rank test for time
[p_time_1_2, ~, stats_time_1_2] = signrank(time_algorithm_1, time_algorithm_2);
disp(['Wilcoxon signed-rank test for time between algorithm 1 and 2: p = ' num2str(p_time_1_2)]);

% Repeat for other combinations of algorithms 1-3
[p_time_1_3, ~, stats_time_1_3] = signrank(time_algorithm_1, time_algorithm_3);
disp(['Wilcoxon signed-rank test for time between algorithm 1 and 3: p = ' num2str(p_time_1_3)]);

[p_time_2_3, ~, stats_time_2_3] = signrank(time_algorithm_2, time_algorithm_3);
disp(['Wilcoxon signed-rank test for time between algorithm 2 and 3: p = ' num2str(p_time_2_3)]);


% Wilcoxon signed-rank test for error
[p_error_1_2, ~, stats_error_1_2] = signrank(error_algorithm_1, error_algorithm_2);
disp(['Wilcoxon signed-rank test for error between algorithm 1 and 2: p = ' num2str(p_error_1_2)]);

% Repeat for other combinations of algorithms 1-3
[p_error_1_3, ~, stats_error_1_3] = signrank(error_algorithm_1, error_algorithm_3);
disp(['Wilcoxon signed-rank test for error between algorithm 1 and 3: p = ' num2str(p_error_1_3)]);

[p_error_2_3, ~, stats_error_2_3] = signrank(error_algorithm_2, error_algorithm_3);
disp(['Wilcoxon signed-rank test for error between algorithm 2 and 3: p = ' num2str(p_error_2_3)]);


% Wilcoxon signed-rank test for rotation
[p_rotation_1_2, ~, stats_rotation_1_2] = signrank(rotation_algorithm_1, rotation_algorithm_2);
disp(['Wilcoxon signed-rank test for rotation between algorithm 1 and 2: p = ' num2str(p_rotation_1_2)]);

[p_rotation_1_3, ~, stats_rotation_1_3] = signrank(rotation_algorithm_1, rotation_algorithm_3);
disp(['Wilcoxon signed-rank test for rotation between algorithm 1 and 3: p = ' num2str(p_rotation_1_3)]);

[p_rotation_2_3, ~, stats_rotation_2_3] = signrank(rotation_algorithm_2, rotation_algorithm_3);
disp(['Wilcoxon signed-rank test for rotation between algorithm 2 and 3: p = ' num2str(p_rotation_2_3)]);




% Wilcoxon signed-rank test for time
[p_time_4_5, ~, stats_time_4_5] = signrank(time_algorithm_4, time_algorithm_5);
disp(['Wilcoxon signed-rank test for time between algorithm 4 and 5: p = ' num2str(p_time_4_5)]);

% Wilcoxon signed-rank test for error
[p_error_4_5, ~, stats_error_4_5] = signrank(error_algorithm_4, error_algorithm_5);
disp(['Wilcoxon signed-rank test for error between algorithm 4 and 5: p = ' num2str(p_error_4_5)]);

% Wilcoxon signed-rank test for rotation
[p_rotation_4_5, ~, stats_rotation_4_5] = signrank(rotation_algorithm_4, rotation_algorithm_5);
disp(['Wilcoxon signed-rank test for rotation between algorithm 4 and 5: p = ' num2str(p_rotation_4_5)]);



% Mann-Whitney U test for time
[p_time_1_4, ~, stats_time_1_4] = ranksum(time_algorithm_1, time_algorithm_4);
disp(['Mann-Whitney U test for time between algorithm 1 and 4: p = ' num2str(p_time_1_4)]);

[p_time_1_5, ~, stats_time_1_5] = ranksum(time_algorithm_1, time_algorithm_5);
disp(['Mann-Whitney U test for time between algorithm 1 and 5: p = ' num2str(p_time_1_5)]);

% Repeat for other combinations of algorithms 1vs4, 1vs5, 2vs4, 2vs5, 3vs4, and 3vs5
[p_time_1_4, ~, stats_time_1_4] = ranksum(time_algorithm_2, time_algorithm_4);
disp(['Mann-Whitney U test for time between algorithm 2 and 4: p = ' num2str(p_time_1_4)]);

[p_time_1_5, ~, stats_time_1_5] = ranksum(time_algorithm_2, time_algorithm_5);
disp(['Mann-Whitney U test for time between algorithm 2 and 5: p = ' num2str(p_time_1_5)]);

[p_time_1_4, ~, stats_time_1_4] = ranksum(time_algorithm_3, time_algorithm_4);
disp(['Mann-Whitney U test for time between algorithm 3 and 4: p = ' num2str(p_time_1_4)]);

[p_time_1_5, ~, stats_time_1_5] = ranksum(time_algorithm_3, time_algorithm_5);
disp(['Mann-Whitney U test for time between algorithm 3 and 5: p = ' num2str(p_time_1_5)]);


% Mann-Whitney U test for error
[p_error_1_4, ~, stats_error_1_4] = ranksum(error_algorithm_1, error_algorithm_4);
disp(['Mann-Whitney U test for error between algorithm 1 and 4: p = ' num2str(p_error_1_4)]);

[p_error_1_5, ~, stats_error_1_5] = ranksum(error_algorithm_1, error_algorithm_5);
disp(['Mann-Whitney U test for error between algorithm 1 and 5: p = ' num2str(p_error_1_5)]);

[p_error_1_4, ~, stats_error_1_4] = ranksum(error_algorithm_2, error_algorithm_4);
disp(['Mann-Whitney U test for error between algorithm 2 and 4: p = ' num2str(p_error_1_4)]);

[p_error_1_5, ~, stats_error_1_5] = ranksum(error_algorithm_2, error_algorithm_5);
disp(['Mann-Whitney U test for error between algorithm 2 and 5: p = ' num2str(p_error_1_5)]);

[p_error_1_4, ~, stats_error_1_4] = ranksum(error_algorithm_3, error_algorithm_4);
disp(['Mann-Whitney U test for error between algorithm 3 and 4: p = ' num2str(p_error_1_4)]);

[p_error_1_5, ~, stats_error_1_5] = ranksum(error_algorithm_3, error_algorithm_5);
disp(['Mann-Whitney U test for error between algorithm 3 and 5: p = ' num2str(p_error_1_5)]);



% Mann-Whitney U test for rotation
[p_rotation_1_4, ~, stats_rotation_1_4] = ranksum(rotation_algorithm_1, rotation_algorithm_4);
disp(['Mann-Whitney U test for rotation between algorithm 1 and 4: p = ' num2str(p_rotation_1_4)]);

[p_rotation_1_5, ~, stats_rotation_1_5] = ranksum(rotation_algorithm_1, rotation_algorithm_5);
disp(['Mann-Whitney U test for rotation between algorithm 1 and 5: p = ' num2str(p_rotation_1_5)]);

[p_rotation_1_4, ~, stats_rotation_1_4] = ranksum(rotation_algorithm_2, rotation_algorithm_4);
disp(['Mann-Whitney U test for rotation between algorithm 2 and 4: p = ' num2str(p_rotation_1_4)]);

[p_rotation_1_5, ~, stats_rotation_1_5] = ranksum(rotation_algorithm_2, rotation_algorithm_5);
disp(['Mann-Whitney U test for rotation between algorithm 2 and 5: p = ' num2str(p_rotation_1_5)]);

[p_rotation_1_4, ~, stats_rotation_1_4] = ranksum(rotation_algorithm_3, rotation_algorithm_4);
disp(['Mann-Whitney U test for rotation between algorithm 3 and 4: p = ' num2str(p_rotation_1_4)]);

[p_rotation_1_5, ~, stats_rotation_1_5] = ranksum(rotation_algorithm_3, rotation_algorithm_5);
disp(['Mann-Whitney U test for rotation between algorithm 3 and 5: p = ' num2str(p_rotation_1_5)]);