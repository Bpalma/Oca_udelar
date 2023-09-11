clc, clearvars, close all

syms x y r
fxy = x^2 + 4 *y^2 - 12*x - 8*y +10;

dx = -diff(fxy,x) * r;
dy = -diff(fxy,y) * r;

%fplot(fxy)
%fimplicit(fxy, [0 12])
%fsurf(fxy)

%%
%inicial

a = 0 + dx ;
b = 0 + dy ;

syms x y r
f(x,y,r) = x^2 + 4 *y^2 - 12*x - 8*y +10;
prim_eval = subs(f(x,y,r), [x, y], [a, b]);
disp(prim_eval)

%%

valor_evaluado = subs(prim_eval, [x, y], [0, 0]);
%valor_evaluado = subs(rt,y,0);
disp(valor_evaluado);

resol = diff(valor_evaluado) == 0;
solucion = solve(resol, r);
disp(solucion)

%%

nuev_a = subs(a, [r,x],[solucion,0]);
nuev_b = subs(b, [r,y] ,[solucion,0]);

double(subs(fxy, [x,y] ,[nuev_a,nuev_b]))

%% primero

a = nuev_a + dx ;
b = nuev_b + dy ;

syms x y r
f(x,y,r) = x^2 + 4 *y^2 - 12*x - 8*y +10;
prim_eval = subs(f(x,y,r), [x, y], [a, b]);
disp(prim_eval)



valor_evaluado = subs(prim_eval, [x, y], [nuev_a, nuev_b]);
%valor_evaluado = subs(rt,y,0);
disp(valor_evaluado);

resol = diff(valor_evaluado) == 0;
solucion = solve(resol, r);
disp(solucion)



nuev_a2 = subs(a, [r,x],[solucion,nuev_a])
nuev_b2 = subs(b, [r,y] ,[solucion,nuev_b])

subs(fxy, [x,y] ,[nuev_a2,nuev_b2]) 

%% segundo

a = nuev_a2 + dx ;
b = nuev_b2 + dy ;

syms x y r
f(x,y,r) = x^2 + 4 *y^2 - 12*x - 8*y +10;
prim_eval = subs(f(x,y,r), [x, y], [a, b])
disp(prim_eval)



valor_evaluado = subs(prim_eval, [x, y], [nuev_a2, nuev_b2]);
%valor_evaluado = subs(rt,y,0);
disp(valor_evaluado);

resol = diff(valor_evaluado) == 0;
solucion = solve(resol, r);
disp(solucion)



nuev_a = subs(a, [r,x],[solucion,nuev_a2])
nuev_b = subs(b, [r,y] ,[solucion,nuev_b2])

subs(fxy, [x,y] ,[nuev_a,nuev_b]) 

%% primero - otra iter

a = nuev_a + dx ;
b = nuev_b + dy ;

syms x y r
f(x,y,r) = x^2 + 4 *y^2 - 12*x - 8*y +10;
prim_eval = subs(f(x,y,r), [x, y], [a, b])
disp(prim_eval)



valor_evaluado = subs(prim_eval, [x, y], [nuev_a, nuev_b]);
%valor_evaluado = subs(rt,y,0);
disp(valor_evaluado);

resol = diff(valor_evaluado) == 0;
solucion = solve(resol, r);
disp(solucion)



nuev_a2 = double(subs(a, [r,x],[solucion,nuev_a]))
nuev_b2 = double(subs(b, [r,y] ,[solucion,nuev_b]))

double(subs(fxy, [x,y] ,[nuev_a2,nuev_b2])) 

%% segundo - ultima iter

a = nuev_a2 + dx ;
b = nuev_b2 + dy ;

syms x y r
f(x,y,r) = x^2 + 4 *y^2 - 12*x - 8*y +10;
prim_eval = subs(f(x,y,r), [x, y], [a, b])
disp(prim_eval)



valor_evaluado = subs(prim_eval, [x, y], [nuev_a2, nuev_b2]);
%valor_evaluado = subs(rt,y,0);
disp(valor_evaluado);

resol = diff(valor_evaluado) == 0;
solucion = solve(resol, r);
disp(solucion)



nuev_a = double(subs(a, [r,x],[solucion,nuev_a2]))
nuev_b = double(subs(b, [r,y] ,[solucion,nuev_b2]))

double(subs(fxy, [x,y] ,[nuev_a,nuev_b]))
