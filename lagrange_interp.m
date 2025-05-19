function yq = lagrangeInterp(x, y, xq)
% LAGRANGEINTERP 使用 Lagrange 多项式进行插值
% 输入:
%   x  - 样本点向量
%   y  - 对应的函数值向量
%   xq - 查询点向量
% 输出:
%   yq - 查询点处的插值结果

n = length(x);
m = length(xq);
yq = zeros(size(xq));

for k = 1:m
    s = 0;
    for i = 1:n
        L = 1;
        for j = [1:i-1, i+1:n]
            L = L * (xq(k) - x(j)) / (x(i) - x(j));
        end
        s = s + y(i) * L;
    end
    yq(k) = s;
end
end
