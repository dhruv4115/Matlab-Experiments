n = -50:50;
impulse = zeros(size(n));
impulse(n==0) = 1;

unit_step = double(n>=0);

ramp = max(0,n);

a= 1.1;
exponential = a .^ n;

omega = pi/4;
sine = sin(omega*n);

cosine = cos(omega*n);

downsample_factor = 10;

%downsample sequences
impulse_down = impulse(1:downsample_factor:end);
unit_step_down = unit_step(1:downsample_factor:end);
ramp_down = ramp(1:downsample_factor:end);
exponential_down = exponential(1:downsample_factor:end);
sine_down = sine(1:downsample_factor:end);
cosine_down = cosine(1:downsample_factor:end);

figure;

subplot(6,2,1);
stem(n,impulse,"filled");
title('Impulse Sequence');
xlabel('n');
ylabel('Amplitude');
grid on;

subplot(6,2,2);
stem(n(1:downsample_factor:end),impulse_down,"filled");
title('Impulse Sequence Downsampled');
xlabel('n');
ylabel('Amplitude');
grid on;

subplot(6,2,3);
stem(n,unit_step,"filled");
title('Unit step Sequence');
xlabel('n');
ylabel('Amplitude');
grid on;

subplot(6,2,4);
stem(n(1:downsample_factor:end),unit_step_down,"filled");
title('Unit Step Sequence Downsampled');
xlabel('n');
ylabel('Amplitude');
grid on;

subplot(6,2,5);
stem(n,ramp,"filled");
title('Ramp Sequence');
xlabel('n');
ylabel('Amplitude');
grid on;

subplot(6,2,6);
stem(n(1:downsample_factor:end),ramp_down,"filled");
title('Ramp Sequence Downsampled');
xlabel('n');
ylabel('Amplitude');
grid on;

subplot(6,2,7);
stem(n,exponential,"filled");
title('Exponential Sequence');
xlabel('n');
ylabel('Amplitude');
grid on;

subplot(6,2,8);
stem(n(1:downsample_factor:end),exponential_down,"filled");
title('Exponential Sequence Downsampled');
xlabel('n');
ylabel('Amplitude');
grid on;

subplot(6,2,9);
stem(n,sine,"filled");
title('Sine Sequence');
xlabel('n');
ylabel('Amplitude');
grid on;

subplot(6,2,10);
stem(n(1:downsample_factor:end),sine_down,"filled");
title('Sine Sequence Downsampled');
xlabel('n');
ylabel('Amplitude');
grid on;

subplot(6,2,11);
stem(n,cosine,"filled");
title('Cosine Sequence');
xlabel('n');
ylabel('Amplitude');
grid on;

subplot(6,2,12);
stem(n(1:downsample_factor:end),cosine_down,"filled");
title('Cosine Sequence Downsampled');xlabel('n');
ylabel('Amplitude');
grid on;

