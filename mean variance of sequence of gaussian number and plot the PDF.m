%parameters
num_samples = 10000;   % number of samples
mu_real = 0; 
mu_imag = 0;             % mean of the gaussian distribution
sigma_real = 1;          % standard deviationof the gaussian distribution
sigma_imag = 1;


%generate gaussian sequence for real and imaginary parts
real_part = mu_real + sigma_real *randn(num_samples,1);
imag_part = mu_imag + sigma_imag *randn(num_samples,1);

%combine to form complex gaussian sequence: x + iy
data = real_part + 1i * imag_part;

%compute mean using the formula
mean_value = sum(data) / num_samples;

%compute variance using the formula
variance_value = sum(abs(data - mean_value).^2) / (num_samples -1);

%display results
fprintf('Mean of the Gaussian Sequence: %.4f + %.4fi\n' , real(mean_value),imag(mean_value));
fprintf('Variance of the Gaussian sequence: %.4f\n' , variance_value);

%plot the PDF of the real part
figure;
subplot(2,1,1);
histogram(real_part, 'Normalization', 'pdf');
title('PDF of the Real Part');
xlabel('Real Part');
ylabel('Probability Density');
grid on;

%plot the PDF of the imaginary part
subplot(2,1,2);
histogram(imag_part, 'Normalization', 'pdf');
title('PDF of the Imaginary Part');
xlabel('Imaginary Part');
ylabel('Probability Density');
grid on;

%Adjust the Layout
sgtitle('PDF of the Generated Complex Gaussian Numbers___20224057');


