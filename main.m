% MAIN 脚本执行所有任务并生成图形

clear; clc; close all;

%% 任务 3：五次多项式的 Lagrange 插值演示
fprintf('任务 3：五次多项式的 Lagrange 插值演示\n');
f = @(x) x.^5 - 5*x.^3 + 4*x;
xq = linspace(-2, 2, 1000);
y_true = f(xq);

figure;
hold on;
for n = 3:7
    x = linspace(-2, 2, n);
    y = f(x);
    yq = lagrangeInterp(x, y, xq);
    plot(xq, yq, 'DisplayName', sprintf('n = %d', n));
end
plot(xq, y_true, 'k--', 'DisplayName', '真实函数');
legend;
title('Lagrange 插值（五次多项式）');
xlabel('x');
ylabel('f(x)');
grid on;

%% 任务 4：七次多项式的 Hermite 插值演示
fprintf('任务 4：七次多项式的 Hermite 插值演示\n');
f = @(x) x.^7 - 14*x.^5 + 49*x.^3 - 36*x;
df = @(x) 7*x.^6 - 70*x.^4 + 147*x.^2 - 36;
xq = linspace(-2, 2, 1000);
y_true = f(xq);

figure;
hold on;
for n = 2:5
    x = linspace(-2, 2, n);
    y = f(x);
    dy = df(x);
    yq = hermiteInterp(x, y, dy, xq);
    plot(xq, yq, 'DisplayName', sprintf('n = %d', n));
end
plot(xq, y_true, 'k--', 'DisplayName', '真实函数');
legend;
title('Hermite 插值（七次多项式）');
xlabel('x');
ylabel('f(x)');
grid on;

%% 任务 5：Runge 函数插值测试
fprintf('任务 5：Runge 函数插值测试\n');
f = @(x) 1 ./ (1 + x.^2);
xq = linspace(-5, 5, 1000);
y_true = f(xq);

figure;
hold on;
for n = [5, 10, 15, 20]
    x = linspace(-5, 5, n);
    y = f(x);
    yq = lagrangeInterp(x, y, xq);
    plot(xq, yq, 'DisplayName', sprintf('n = %d', n));
end
plot(xq, y_true, 'k--', 'DisplayName', '真实函数');
legend;
title('Runge 函数的 Lagrange 插值');
xlabel('x');
ylabel('f(x)');
grid on;

%% 任务 6：非线性非多项式函数插值观察
fprintf('任务 6：非线性非多项式函数插值观察\n');
f = @(x) sin(x);
xq = linspace(0, 4*pi, 1000);
y_true = f(xq);

figure;
hold on;
for n = [5, 10, 15, 20]
    x = linspace(0, 4*pi, n);
    y = f(x);
    yq = lagrangeInterp(x, y, xq);
    plot(xq, yq, 'DisplayName', sprintf('n = %d', n));
end
plot(xq, y_true, 'k--', 'DisplayName', '真实函数');
legend;
title('sin(x) 的 Lagrange 插值');
xlabel('x');
ylabel('f(x)');
grid on;
