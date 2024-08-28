clear all;
close all;

f = 5;  % Frequency of the signal
fs = 50;  % Sampling frequency
ts = 1/fs;  % Sampling time interval
t = 0:ts:5;  % Time vector from 0 to 5 seconds
x1 = sin(2*pi*f*t);  % Original sine wave signal

subplot(3,1,1);
plot(t, x1);
hold on;
plot(t, x1, '*');
ylabel('Amplitude');
xlabel('Time (s)');
title('Signal at 50 Hz');

fs1 = 12.5;  % New sampling frequency
ts1 = 1/fs1;  % New sampling time interval
t1 = 0:ts1:5;  % New time vector from 0 to 5 seconds
x2 = sin(2*pi*f*t1);  % Downsampled sine wave signal

subplot(3,1,2);
plot(t1, x2);
xlabel('Time (s)');
ylabel('Amplitude');
title('Signal at 12.5 Hz');

% Reconstruct the signal: Replace zeros with 2*sin(2*pi*5*i)
for i = 1:length(x1)
    if x1(i) == 0
        x1(i) = 2*sin(2*pi*5*t(i));
    end
end

subplot(3,1,3);
plot(t, x1);
xlabel('Time (s)');
ylabel('Amplitude');
title('Reconstructed Signal__20224057');
