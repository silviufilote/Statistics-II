clc, clear, close all

% generate test data
x = randn(1, 100);

% perform signal stationarity test
[wss_flag, mean_stat_flag, var_stat_flag, cov_stat_flag] = isstationary(x);

% visualize the results
% Note: The signal is estimated as wide-sense stationary when it is
% simultaneously stationary about its mean, variance and autocovariance.
commandwindow 
table(mean_stat_flag, var_stat_flag, cov_stat_flag, wss_flag, 'VariableNames', ...
     {'Mean_stationary', 'Variance_stationary', 'Covariance_stationary', 'WSS'})