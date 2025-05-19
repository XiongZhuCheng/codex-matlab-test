function yq = lagrangeInterp(x, y, xq)
%LAGRANGEINTERP  Interpolation using Lagrange polynomials.
%
%   yq = lagrangeInterp(x, y, xq) computes the values of the Lagrange
%   interpolation polynomial defined by the nodes in x and function values
%   y at the query points xq.
%
%   Inputs:
%       x  - vector of sample nodes
%       y  - function values at the nodes
%       xq - points where the interpolating polynomial is evaluated
%
%   Output:
%       yq - interpolated values at xq

n = numel(x);
if numel(y) ~= n
    error('Vectors x and y must have the same length.');
end

yq = zeros(size(xq));
for k = 1:numel(xq)
    xx = xq(k);
    s  = 0;
    for i = 1:n
        L = 1;
        for j = [1:i-1, i+1:n]
            L = L * (xx - x(j)) / (x(i) - x(j));
        end
        s = s + y(i) * L;
    end
    yq(k) = s;
end
end
