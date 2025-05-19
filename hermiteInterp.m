function yq = hermiteInterp(x, y, dy, xq)
%HERMITEINTERP  Hermite interpolation using given nodes and derivatives.
%
%   yq = hermiteInterp(x, y, dy, xq) interpolates the data (x, y) with
%   derivatives dy at the nodes x and evaluates the resulting Hermite
%   polynomial at points xq. x, y and dy must be vectors of the same
%   length.
%
%   Inputs:
%       x  - vector of sample nodes
%       y  - function values at the nodes
%       dy - derivative values at the nodes
%       xq - query points for evaluation
%
%   Output:
%       yq - interpolated values at xq
%
%   The implementation follows the standard Hermite interpolation
%   formulation using Lagrange basis polynomials and their derivatives.

n  = numel(x);
if numel(y) ~= n || numel(dy) ~= n
    error('Input vectors x, y and dy must have the same length.');
end

% Pre-compute denominators of the Lagrange basis and their derivatives at xi
Lden  = zeros(1, n);    % denominators of L_i(x)
Lder  = zeros(1, n);    % derivatives L_i''(x_i)
for i = 1:n
    others = [1:i-1, i+1:n];
    diffxi = x(i) - x(others);
    Lden(i) = prod(diffxi);
    Lder(i) = sum(1./diffxi);   % derivative of L_i at x_i
end

% Evaluate interpolation
yq = zeros(size(xq));
for k = 1:numel(xq)
    xx = xq(k);
    s  = 0;
    for i = 1:n
        others = [1:i-1, i+1:n];
        Li = prod(xx - x(others)) / Lden(i);
        h1 = (1 - 2*(xx - x(i))*Lder(i)) * Li^2;
        h2 = (xx - x(i)) * Li^2;
        s = s + y(i)*h1 + dy(i)*h2;
    end
    yq(k) = s;
end
end
