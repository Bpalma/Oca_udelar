clc, clearvars, close all
format short

%defino la funcion y las variables 
syms x y r
ecuacion = 2*x^2 + 5*y^2 + 2*x*y - 12*x - 8*y +10;

fx = inline(ecuacion); %fx = @(u, v) subs(ecuacion, [x, y], [u, v]); %otra opcion de evaluacion
fobj= @(x) fx(x(:,1), x(:,2));


%defino la derivada de la funcion
derivada = gradient(ecuacion);
gx = inline(derivada); %la convierto en una funcion evaluable
dx = @(x) gx(x(:,1), x(:,2));


%parametros del algoritmo

x0 = [3 3]; %defino vector inicial
maxiter = 20; %maximo de iteraciones
tol = 1e-6; % maximo error
iter = 1; %contador
X = []; %vector con soluciones
vx = []; %valor x para grafico
vy = []; %valor y para grafico
%algoritmo

while norm(dx(x0))> tol && iter< maxiter
    X = [X,x0];
    vx = [vx,x0(1)]; %guarda valores de x para grafico
    vy = [vy,x0(2)]; %guarda valores de y para grafico
    Gi = -dx(x0);
    
    %
    obj = fobj(transpose(Gi*r));
    obj = diff(obj,r);
    obj2 = inline(obj);
    fobj2= @(u) obj2(u);
    

    %busqueda no lineal de x
    [A, B, R] = biparticion(-10,10, tol, fobj2); %parametro de busqueda
    tau= R(end);
    Xnue = x0+tau.*Gi'; %actualiza valor de X
    x0 = Xnue; %guarda valor de X
    iter = iter+1; %actualiza la iteracion
end

%%% Devolucion de solucion
fprintf('La solucion optima es x = [%f, %f]\n',x0(1),x0(2));
fprintf('El valor optimo es f(x) = %f \n',fobj(x0));



%% GRAFICO de la funcion
x = linspace(-10, 10, 100); % Genera 100 puntos en el rango de -10 a 10 para x
y = linspace(-10, 10, 100); % Genera 100 puntos en el rango de -10 a 10 para y
[X, Y] = meshgrid(x, y);
Ze = 2*X.^2 + 5*Y.^2 + 2*X.*Y - 12*X - 8*Y + 10;

syms x y
Z = 2*x^2 + 5*y^2 + 2*x*y - 12*x - 8*y + 10;
% Inicializar un arreglo para almacenar los valores de Z en los puntos (vx, vy)
Z_values = zeros(size(vx));

% Calcular Z en cada punto (vx, vy)
for i = 1:length(vx)
    Z_values(i) = subs(Z, [x, y], [vx(i), vy(i)]);
end


% Crear el gráfico de superficie
figure;
surf(X, Y, Ze);
xlabel('x');
ylabel('y');
zlabel('f(x, y)');
title('Gráfico de 2x^2 + 5y^2 + 2xy - 12x - 8y + 10');


% Agregar el punto mínimo al gráfico
hold on;
plot3(vx, vy, Z_values, '-.','Color','r', 'MarkerSize', 10,'LineWidth',2 );
hold off;




%% Metodo analitico

clc, clearvars, close all
format short

%defino la funcion y las variables 
syms x y r
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

x0 = [-10 10]; %defino vector inicial
maxiter = 14; %maximo de iteraciones con el valor 2 se parece a mi biseccion
tol = 1e-6; % maximo error
iter = 1; %contador
X = []; %vector con soluciones
vx = []; %valor x para grafico
vy = []; %valor y para grafico

while norm(dx(x0))> tol && iter< maxiter
    X = [X,x0]; %vector de resultados
    vx = [vx,x0(1)]; %guarda valores de x para grafico
    vy = [vy,x0(2)]; %guarda valores de y para grafico
    Gi = -dx(x0); %gradiente evaluado en el valor reciente de X
    
    H= Hx(x0); %hessiana evaluado en el valor reciente de X
    lam = Gi'*Gi./(Gi'*H*Gi); %lambda
    Xnue = x0+lam.*Gi'; %actualiza valor de X
    x0 = Xnue; %guarda valor de X
    iter = iter+1; %actualiza la iteracion
end

fprintf('La solucion optima es x = [%f, %f]\n',x0(1),x0(2));
fprintf('El valor optimo es f(x) = %f \n',fobj(x0));    
    
    
    
    
