%define the numerator coefficients of transfer function
num = [5 -9 16 -14];

%define the denominator coefficients of transfer function
den = [1 -2 10 -4 64];

%create the transfer function
sys = tf(num, den);

%plot the pole-zero plot map
figure;

pzmap(sys);
hold on;
poles = pole(sys);
zeros = zero(sys);

%plot poles
plot(real(poles),imag(poles), 'r*','MarkerSize',8,'DisplayName','Poles');

%plot zeros
plot(real(poles),imag(poles), 'bo','MarkerSize',8,'DisplayName','zeros');

title('Pole-Zero Plot ___20224057');
legend('Poles','Zeros');
grid on;
