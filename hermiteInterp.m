function yq = hermiteInterp(x, y, dy, xq)
% HERMITEINTERP 使用 Hermite 多项式进行插值
% 输入:
%   x   - 样本点向量
%   y   - 对应的函数值向量
%   dy  - 对应的导数值向量
%   xq  - 查询点向量
% 输出:
%   yq  - 查询点处的插值结果

n = length(x);
m = length(xq);
yq = zeros(size(xq));

for k = 1:m
    s = 0;
    for i = 1:n
        % 构造 l_i(x)
        li = 1;
        for j = [1:i-1, i+1:n]
            li = li * (xq(k) - x(j)) / (x(i) - x(j));
        end
        % 计算 l_i'(x_i)
        dli = 0;
        for j = [1:i-1, i+1:n]
            prod = 1;
            for m = [1:i-1, i+1:n]
                if m ~= j
                    prod = prod * (x(i) - x(m));
                end
            end
            dli = dli + prod;
        end
        dli = dli / li;

        h1 = (1 - 2 * (xq(k) - x(i)) * dli) * li^2;
        h2 = (xq(k) - x(i)) * li^2;

        s = s + y(i) * h1 + dy(i) * h2;
    end
    yq(k) = s;
end
end
