%defining two sequences
x = [1,2,3,4,5];
y = [2,3,4,5,6];

%Lenght of sequences
Nx = length(x);
Ny = length(y);

%compute cross-correlation manually
manual_cross_corr = zeros(1,Nx+Ny-1);

%perform cross-correlation
for lag = -(Ny-1):(Nx-1)
    sum = 0;
    for i = 1:Nx
        j = i - lag;
        if(j>=1 && j<=Ny)
            sum = sum + x(i)*y(j);
        end
    end
    manual_cross_corr(lag+Ny) = sum;
end

%display the manual cross correlation
disp('Manual cross-correlation of sequences x and y:');
disp(manual_cross_corr);

%verify using the inbuilt function
builtin_cross_corr = xcorr(x,y);

%display the built in cross correlation result
disp('Built-in cross-correlation of sequences x and y:');
disp(builtin_cross_corr);

%plot both results for comparison
figure;

subplot(2,1,1);
stem(manual_cross_corr);
title('Manual Cross-Correlation ____20224058');
xlabel('Lag');
ylabel('Cross-Correlation');

subplot(2,1,2);
stem(builtin_cross_corr);
title('Built-in Cross-Correlation ____20224058');
xlabel('Lag');
ylabel('Cross-Correlation');