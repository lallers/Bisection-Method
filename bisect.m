function [r, err] = bisect(f,a,b,tol,maxi)
% r = BISECT(f,a,b,tol) approximates the root of a function
% using the method of bisection
%
% inputs
% ------
% f: function handle for objective function
% a,b: points satisfying b > a and f(a)*f(b) < 0
% tol: tolerance for approximate root
% maxi: sets a maximum number of iterations
%
% outputs
% -------
% r: approximate root of objective function
% See example script for more info

if nargin < 5
    maxi = 5000;
end

tic;
fa = f(a);
fb = f(b);

if fa*fb > 0
    error('Objective function must change signs');
end

i = 0;
[r, err] = bisectbox(f,a,b,tol,fa,fb,i,maxi);
end

function [r, err] = bisectbox(f,a,b,tol,fa,fb,i,maxi)
i = i + 1;

c = (a+b)/2;
fc = f(c);

if abs(a-b)/2 < tol || fc == 0
    r = c;
    err = abs(b-a)/2;
    t = toc;
    fprintf('Completed in %g iterations (%.03f s).\n',i,t)
    return
elseif i >= maxi
    t = toc;
    err = abs(b-a)/2;
    fprintf('Failed at %g iterations (%.03f s).\n',i,t) 
    return
elseif fa*fc < 0
    [r, err] = bisectbox(f,a,c,tol,fa,fc,i,maxi);
else
    [r, err] = bisectbox(f,c,b,tol,fc,fb,i,maxi);
end
end
