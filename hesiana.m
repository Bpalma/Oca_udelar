clc, clearvars, close all
f = '2*x^2 + 5*y^2 + 2*x*y - 12*x - 8*y +10';
u = sym(str2sym(f));
variables = ['x','y'];
x = str2sym(variables(1));
y = str2sym(variables(2));

H = hessian(u,[x,y]); %str2sym(['x','y','r'])
Z = [2 14]
disp(H * Z')



