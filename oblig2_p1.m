clc
clearvars 
clear

%%
%2 Descenso por Gradiente y Conjugado
 
% funcion 
ec =  '2*x^2 + 5*y^2 + 2*x*y - 12*x - 8*y +10';
variables = ['x','y'];
[f, fp] = fun(ec, variables);

%%

variables(2)