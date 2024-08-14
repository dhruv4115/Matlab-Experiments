clear all;
close all;

x = randi([-100,100],1,50);

N = length(x);

%initialise DFT and IDFT arrays
X = zeros(1,N);        %DFT array
x_idft = zeros(1,N);   %IDFT array

%compute DFT
for k = 0:N-1
    for n = 0:N-1
        X(k+1) = X(k+1) + x(n+1)*exp(-1j*2*pi*k*n/N);
    end
end

%compute IDFT
for n = 0:N-1
    for k = 0:N-1
        x_idft(n+1) = x_idft(n+1) + X(k+1)*exp(1j*2*pi*k*n/N);
    end
end

%Display results
disp('Input Sequence x[n]:');
disp(x);

disp('DFT X[k]:');
disp(X);

disp('IDFT of X[k]:');
disp(x_idft);

%plot results
figure;

subplot(3,1,1);
stem(0:N-1,x,'filled');
title('Input Sequence x[n]');
xlabel('n');
ylabel('x[n]');
grid on;

subplot(3,1,2);
stem(0:N-1, abs(X),'filled');
title('Magnitude of DFT X[k]');
xlabel('k');
ylabel('|X[k]|');
grid on;

subplot(3,1,3);
stem(0:N-1, real(x_idft), 'filled');
title('IDFT Sequence x_{idft}[n] ___20224057');
xlabel('n');
ylabel('x_{idft}[n]');
grid on;