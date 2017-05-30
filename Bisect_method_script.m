%---------Bisect Method--------------
clc;clear all
% An open-top box is constructed from a rectangular piece of sheet metal measuring
%10 by 16 inches. Squares of what size (accurate to 10 decimal places) should be cut
%from the corners if the volume of the box is to be 100 cubic inches?
%Choosing initial conditions [0,2] and definied tolerance:

a = 0;b = 2;
vol_box = 100;
tol = 10e-10;
f = @(x) 12*x^2 - 104*x + 160;
[Sides, Error] = bisect(f,a,b,tol,1000);


%Example 2
a = .5;
b = .6;
tol = 1e-12;
f = @(x) log(x) + x;
[roots, Error2] = bisect(f,a,b,tol,1000);
%/////////////////////////////////