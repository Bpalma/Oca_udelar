
%% NOSE QUE ESTO
clc, clearvars, close all
format short

%defino la funcion y las variables 
syms x y
ecuacion = 2*x^2 + 5*y^2 + 2*x*y - 12*x - 8*y +10;

fx = inline(ecuacion); %fx = @(u, v) subs(ecuacion, [x, y], [u, v]); %otra opcion de evaluacion
fobj= @(x) fx(x(:,1), x(:,2));

%defino la derivada de la funcion
derivada = gradient(ecuacion);
gx = inline(derivada); %la convierto en una funcion evaluable
dx = @(x) gx(x(:,1), x(:,2));

%defino la hessiana de la funcion
Hess = hessian(ecuacion);
Hx = inline(Hess);


%parametros del algoritmo

x0 = [-6 -8]; %defino vector inicial
maxiter = 4; %maximo de iteraciones
tol = 1e-6; % maximo error
iter = 1; %contador
S = [];
vx = []; %vector con soluciones
vy = []; 

%algoritmo
Dir = 0; %direccion inicial
Gpr = -dx(x0); %derivada inicial

%verificacion para que la norma evaluada no haga que el valor de beta sea indeterminacion 
if norm(Gpr) == 0
    disp('cambia x0');
    x0 = input('Nuevo valor del vector inicial x0');
    Gpr = -dx(x0);

end

while norm(dx(x0))> tol && iter< maxiter
    S = [S,x0];
    vx = [vx,x0(1)];
    vy = [vy,x0(2)];
    Gi = -dx(x0);
    H = Hx(x0);
    beta = norm(Gi).^2./norm(Gpr).^2; %Polak Ribiere
    Dir = Gi + beta.*Dir; %nueva direccion
    
    %betafr = norm(Gi)'*(norm(Gi)-norm(Gpr)) /norm(Gpr).^2; %Fletcher-Reeves
    %Dir = Gi + betafr.*Dir;
    
    %busqueda no lineal de x
    lambda = Gi'*Gi./ (Dir'*H*Dir); %parametro de busqueda
    Xnue = x0+lambda.*Dir'; %actualiza valor de X
    x0 = Xnue; %guarda valor de X
    Gpr = Gi; %actualiza el gradiente
    iter = iter+1; %actualiza la iteracion
end

vx = [vx,x0(1)];
vy = [vy,x0(2)];

%%% Devolucion de solucion
fprintf('La solucion optima es x = [%f, %f]\n',x0(1),x0(2));
fprintf('El valor optimo es f(x) = %f \n',fobj(x0));


%%

% Definir la función objetivo
f = @(x1, x2) (1 - x1).^2 + 100 * (x2 - x1.^2).^2;

% Crear un rango de valores para x1 y x2
x1 = linspace(-2.5, 2.5, 20);
x2 = linspace(-1, 5, 20);

% Crear una cuadrícula 2D de valores de x1 y x2
[X1, X2] = meshgrid(x1, x2);

% Calcular los valores de la función en la cuadrícula
Z = f(X1, X2);

% Crear el gráfico de curvas de nivel
contour(X1, X2, Z, logspace(-2, 3, 20), 'LineWidth', 0.5);
colorbar; % Mostrar la barra de colores (valores de la función)

% Etiquetas de ejes y título
xlabel('x1');
ylabel('x2');
title('Curvas de Nivel de (1 - x1)^2 + 100 * (x2 - x1^2)^2');

% Añadir un punto para resaltar el mínimo global conocido (1, 1)
hold on;
plot(x_min(1), x_min(2), 'ro', 'MarkerSize', 10, 'LineWidth', 2);
plot(X, Y, 'ro', 'MarkerSize', 1, 'LineWidth', 2);

hold off;
