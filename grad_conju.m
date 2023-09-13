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

x0 = [0 0]; %defino vector inicial
maxiter = 4; %maximo de iteraciones
tol = 1e-6; % maximo error
iter = 1; %contador
X = []; %vector con soluciones

%algoritmo
Dir = 0; %direccion inicial
Gpr = -dx(x0); %derivada inicial

if norm(Gpr) == 0
    disp('cambia x0');
    x0 = input('Nuevo valor del vector inicial x0');
    Gpr = -dx(x0);

end

while norm(dx(x0))> tol && iter< maxiter
    X = [X,x0];
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


%%% Devolucion de solucion
fprintf('La solucion optima es x = [%f, %f]\n',x0(1),x0(2));
fprintf('El valor optimo es f(x) = %f \n',fobj(x0));

