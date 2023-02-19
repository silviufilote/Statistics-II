clc, clear, close all

% generate test data
fs = 44100;
t = 0:1/fs:5;
x = chirp(t, 1000, 5, 10000);

% perform signal stationarity test and visualize the results
commandwindow
if isstationary(x)
    disp('The signal is wide-sense stationary!')
else
    disp('The signal is not wide-sense stationary!')
end