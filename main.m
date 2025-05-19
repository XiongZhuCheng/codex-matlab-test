% MAIN Script to demonstrate Lagrange and Hermite interpolation
% Executes the tasks described in the assignment.

clear; clc; close all;

%% Task 3: Lagrange interpolation of a degree-5 polynomial
fprintf('Task 3: Lagrange interpolation of a degree-5 polynomial\n');
f  = @(x) x.^5 - 5*x.^3 + 4*x;               % degree 5 with 2 minima/maxima
xq = linspace(-2, 2, 1000);
y_true = f(xq);

figure('Name','Task3'); hold on;
for n = 3:7
    x  = linspace(-2, 2, n);
    y  = f(x);
    yq = lagrangeInterp(x, y, xq);
    max_err = max(abs(y_true - yq));
    fprintf('  n = %d, max error = %.2e\n', n, max_err);
    plot(xq, yq, 'DisplayName', sprintf('n = %d', n));
end
plot(xq, y_true, 'k--', 'DisplayName', 'original');
legend show
xlabel('x'); ylabel('f(x)'); grid on;
title('Lagrange interpolation of a degree-5 polynomial');

%% Task 4: Hermite interpolation of a degree-7 polynomial
fprintf('\nTask 4: Hermite interpolation of a degree-7 polynomial\n');
f  = @(x) x.^7 - 14*x.^5 + 49*x.^3 - 36*x;    % degree 7
df = @(x) 7*x.^6 - 70*x.^4 + 147*x.^2 - 36;   % derivative
xq = linspace(-2, 2, 1000);
y_true = f(xq);

figure('Name','Task4'); hold on;
for n = 2:5
    x  = linspace(-2, 2, n);
    y  = f(x);
    dy = df(x);
    yq = hermiteInterp(x, y, dy, xq);
    max_err = max(abs(y_true - yq));
    fprintf('  n = %d, max error = %.2e\n', n, max_err);
    plot(xq, yq, 'DisplayName', sprintf('n = %d', n));
end
plot(xq, y_true, 'k--', 'DisplayName', 'original');
legend show
xlabel('x'); ylabel('f(x)'); grid on;
title('Hermite interpolation of a degree-7 polynomial');

%% Task 5: Runge function interpolation
fprintf('\nTask 5: Interpolation of the Runge function 1/(1+x^2)\n');
f  = @(x) 1./(1 + x.^2);
xq = linspace(-5, 5, 1000);
y_true = f(xq);

figure('Name','Task5'); hold on;
for n = [5, 10, 15, 20]
    x  = linspace(-5, 5, n);
    y  = f(x);
    yq = lagrangeInterp(x, y, xq);
    plot(xq, yq, 'DisplayName', sprintf('n = %d', n));
end
plot(xq, y_true, 'k--', 'DisplayName', 'original');
legend show
xlabel('x'); ylabel('f(x)'); grid on;
title('Runge function: Lagrange interpolation with equally spaced nodes');

%% Task 6: Interpolation of a sinusoidal function
fprintf('\nTask 6: Interpolation of sin(x) on [0, 4pi]\n');
f  = @(x) sin(x);
xq = linspace(0, 4*pi, 1000);
y_true = f(xq);

figure('Name','Task6'); hold on;
for n = [5, 10, 15, 20]
    x  = linspace(0, 4*pi, n);
    y  = f(x);
    yq = lagrangeInterp(x, y, xq);
    plot(xq, yq, 'DisplayName', sprintf('n = %d', n));
end
plot(xq, y_true, 'k--', 'DisplayName', 'original');
legend show
xlabel('x'); ylabel('f(x)'); grid on;
title('sin(x): Lagrange interpolation with equally spaced nodes');
