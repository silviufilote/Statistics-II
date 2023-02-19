clear, clc, close all

%% generate test signals
% sampling frequency
fs = 44100;

% TS1 
% sine-wave signal with linear trend (stationary signal)
t1 = 0:1/fs:5;
x1 = 1 + 0.1*t1 + 1.0*sin(2*pi*440*t1);

% TS2
% white noise (stationary signal)
x2 = randn(1, 5*fs);

% TS3
% violet noise (stationary signal)
x3 = violetnoise(1, 5*fs);

% TS4
% linear chirp signal  (non-stationary signal)
t4 = 0:1/fs:5;
x4 = chirp(t4, 1000, 5, 10000);

% TS5a
% sequence of sine-waves (non-stationary signal)
t51 = 0:1/fs:1;
t52 = 0:1/fs:4;
x5a1 = 1.0*sin(2*pi*440*t51);
x5a2 = 2.0*sin(2*pi*440*t52);
x5a = [x5a1 x5a2];

% TS5b
% sequence of sine-waves (non-stationary signal)
x5b1 = 1.0*sin(2*pi*440*t51);
x5b2 = 1.0*sin(2*pi*1000*t52);
x5b = [x5b1 x5b2];

% TS6
% red noise (non-stationary signal)
x6 = rednoise(1, 5*fs);

% TS7
% human speech (non-stationary signal)
x7 = audioread('DR2_FRAM1_SI522.wav');

% TS8
% sound (non-stationary signal)
x8 = load('handel.mat');
x8 = x8.y;

%% perform signal stationarity test
[~, mean_stat_flag1, var_stat_flag1, covar_stat_flag1] = isstationary(x1);
[~, mean_stat_flag2, var_stat_flag2, covar_stat_flag2] = isstationary(x2);
[~, mean_stat_flag3, var_stat_flag3, covar_stat_flag3] = isstationary(x3);
[~, mean_stat_flag4, var_stat_flag4, covar_stat_flag4] = isstationary(x4);
[~, mean_stat_flag5a, var_stat_flag5a, covar_stat_flag5a] = isstationary(x5a);
[~, mean_stat_flag5b, var_stat_flag5b, covar_stat_flag5b] = isstationary(x5b);
[~, mean_stat_flag6, var_stat_flag6, covar_stat_flag6] = isstationary(x6);
[~, mean_stat_flag7, var_stat_flag7, covar_stat_flag7] = isstationary(x7);
[~, mean_stat_flag8, var_stat_flag8, covar_stat_flag8] = isstationary(x8);

%% visualize the results
% Note: A novel visual representation of the signal stationarity estimation
% is proposed for better perception named "Statinary semaphore". All three
% Boolean flags must be rised in order a given signal to be estimated as
% wide-sense stationary i.e, stationary about its mean, variance and
% autocovariance.

figure(1)
subplot(3, 3, 1)
matvisual([mean_stat_flag1; var_stat_flag1; covar_stat_flag1], 'annotation')
set(gca, 'FontName', 'Times New Roman', 'FontSize', 12)
title(['Stationarity' newline 'semaphore for TS1'], 'FontSize', 12)
xlabel([])
ylabel([])
set(gca, 'XTickLabel', [])
set(gca, 'YTickLabel', {'Mean', 'Variance', 'Autocovariance'})
colormap([0.75, 0, 0; 0, 0.75, 0])
set(gcf, 'Units', 'Normalized')
set(gcf, 'Position', [0.325, 0.1, 0.35, 0.8])

subplot(3, 3, 2)
matvisual([mean_stat_flag2; var_stat_flag2; covar_stat_flag2], 'annotation')
set(gca, 'FontName', 'Times New Roman', 'FontSize', 12)
title(['Stationarity' newline 'semaphore for TS2'], 'FontSize', 12)
xlabel([])
ylabel([])
set(gca, 'XTickLabel', [])
set(gca, 'YTickLabel', {'Mean', 'Variance', 'Autocovariance'})
colormap([0.75, 0, 0; 0, 0.75, 0])
set(gcf, 'Units', 'Normalized')
set(gcf, 'Position', [0.325, 0.1, 0.35, 0.8])

subplot(3, 3, 3)
matvisual([mean_stat_flag3; var_stat_flag3; covar_stat_flag3], 'annotation')
set(gca, 'FontName', 'Times New Roman', 'FontSize', 12)
title(['Stationarity' newline 'semaphore for TS3'], 'FontSize', 12)
xlabel([])
ylabel([])
set(gca, 'XTickLabel', [])
set(gca, 'YTickLabel', {'Mean', 'Variance', 'Autocovariance'})
colormap([0.75, 0, 0; 0, 0.75, 0])
set(gcf, 'Units', 'Normalized')
set(gcf, 'Position', [0.325, 0.1, 0.35, 0.8])

subplot(3, 3, 4)
matvisual([mean_stat_flag4; var_stat_flag4; covar_stat_flag4], 'annotation')
set(gca, 'FontName', 'Times New Roman', 'FontSize', 12)
title(['Stationarity' newline 'semaphore for TS4'], 'FontSize', 12)
xlabel([])
ylabel([])
set(gca, 'XTickLabel', [])
set(gca, 'YTickLabel', {'Mean', 'Variance', 'Autocovariance'})
colormap([0.75, 0, 0; 0, 0.75, 0])
set(gcf, 'Units', 'Normalized')
set(gcf, 'Position', [0.325, 0.1, 0.35, 0.8])

subplot(3, 3, 5)
matvisual([mean_stat_flag5a; var_stat_flag5a; covar_stat_flag5a], 'annotation')
set(gca, 'FontName', 'Times New Roman', 'FontSize', 12)
title(['Stationarity' newline 'semaphore for TS5a'], 'FontSize', 12)
xlabel([])
ylabel([])
set(gca, 'XTickLabel', [])
set(gca, 'YTickLabel', {'Mean', 'Variance', 'Autocovariance'})
colormap([0.75, 0, 0; 0, 0.75, 0])
set(gcf, 'Units', 'Normalized')
set(gcf, 'Position', [0.325, 0.1, 0.35, 0.8])

subplot(3, 3, 6)
matvisual([mean_stat_flag5b; var_stat_flag5b; covar_stat_flag5b], 'annotation')
set(gca, 'FontName', 'Times New Roman', 'FontSize', 12)
title(['Stationarity' newline 'semaphore for TS5b'], 'FontSize', 12)
xlabel([])
ylabel([])
set(gca, 'XTickLabel', [])
set(gca, 'YTickLabel', {'Mean', 'Variance', 'Autocovariance'})
colormap([0.75, 0, 0; 0, 0.75, 0])
set(gcf, 'Units', 'Normalized')
set(gcf, 'Position', [0.325, 0.1, 0.35, 0.8])

subplot(3, 3, 7)
matvisual([mean_stat_flag6; var_stat_flag6; covar_stat_flag6], 'annotation')
set(gca, 'FontName', 'Times New Roman', 'FontSize', 12)
title(['Stationarity' newline 'semaphore for TS6'], 'FontSize', 12)
xlabel([])
ylabel([])
set(gca, 'XTickLabel', [])
set(gca, 'YTickLabel', {'Mean', 'Variance', 'Autocovariance'})
colormap([0.75, 0, 0; 0, 0.75, 0])
set(gcf, 'Units', 'Normalized')
set(gcf, 'Position', [0.325, 0.1, 0.35, 0.8])

subplot(3, 3, 8)
matvisual([mean_stat_flag7; var_stat_flag7; covar_stat_flag7], 'annotation')
set(gca, 'FontName', 'Times New Roman', 'FontSize', 12)
title(['Stationarity' newline 'semaphore for TS7'], 'FontSize', 12)
xlabel([])
ylabel([])
set(gca, 'XTickLabel', [])
set(gca, 'YTickLabel', {'Mean', 'Variance', 'Autocovariance'})
colormap([0.75, 0, 0; 0, 0.75, 0])
set(gcf, 'Units', 'Normalized')
set(gcf, 'Position', [0.325, 0.1, 0.35, 0.8])

subplot(3, 3, 9)
matvisual([mean_stat_flag8; var_stat_flag8; covar_stat_flag8], 'annotation')
set(gca, 'FontName', 'Times New Roman', 'FontSize', 12)
title(['Stationarity' newline 'semaphore for TS8'], 'FontSize', 12)
xlabel([])
ylabel([])
set(gca, 'XTickLabel', [])
set(gca, 'YTickLabel', {'Mean', 'Variance', 'Autocovariance'})
colormap([0.75, 0, 0; 0, 0.75, 0])
set(gcf, 'Units', 'Normalized')
set(gcf, 'Position', [0.325, 0.1, 0.35, 0.8])