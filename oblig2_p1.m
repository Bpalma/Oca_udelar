clc, clearvars, close all

data = load('aptsHUY1.txt');
%% Codigo errmu

% 0.8781814575195312

format long;
[a, b, r] = biparticion (0, 2, 1e-6, @(u) errMup(data,u));

fprintf ("El mu optimo para la funcion errmu es %d\n\n", r(end) )


format long;
[c, d, t] = regla_wolfe (0, 1,  @(u) errMu(data,u),@(u) errMup(data,u));

fprintf ("el valor de la regla de wolfe para la funcion errmu es %d\n\n", t(end) )

%% Codigo exponencial

format long;
[a, b, r] = biparticion (0, 2, 1e-6, @(u) dexph(u));

fprintf ("El mu optimo para la funcion es %d\n\n", r(end) )


format long;
[c, d, t] = regla_wolfe (0, 1,  @(u) exph(u),@(u) dexph(u));

fprintf ("el valor de la regla de wolfe para la funcion exponencial es es %d\n\n", t(end) )

%syms r
%outputArg1 = (exp(r-1) + exp(1-r)) / 2 + (r.^2)/10;
%diff(outputArg1,r)


%%
%2 Descenso por Gradiente y Conjugado
 
% funcion 
ec =  'x^2 + 4 *y^2 - 12*x - 8*y +10'; %'2*x^2 + 5*y^2 + 2*x*y - 12*x - 8*y +10';
variables = ['x','y','r'];
[f, dx,dy] = fun(ec, variables);




%%

variables(2)