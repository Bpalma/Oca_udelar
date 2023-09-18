clc, clearvars, close all
format short

% Llamar a la función de optimización
x0 = [-5 2]; % Punto inicial [-1.5; 3]
tolerancia = 1e-6; % Tolerancia de convergencia
[vx,vy,x_min, f_min, iter] = steepestDescentWolfe(x0, tolerancia);

% Mostrar resultados
fprintf('Solución encontrada:\n');
fprintf('x = %.6f, y = %.6f\n', x_min(1), x_min(2));
fprintf('Valor mínimo de la función: %.6f\n', f_min);
fprintf('Iteraciones: %d\n', iter);



%% GRAFICO de la funcion
x = linspace(-10, 10, 100); % Genera 100 puntos en el rango de -10 a 10 para x
y = linspace(-10, 10, 100); % Genera 100 puntos en el rango de -10 a 10 para y
[X, Y] = meshgrid(x, y);
Ze = 2*X.^2 + 5*Y.^2 + 2*X.*Y - 12*X - 8*Y + 10;

syms x y
Z = 2*x^2 + 5*y^2 + 2*x*y - 12*x - 8*y + 10;
% Inicializar un arreglo para almacenar los valores de Z en los puntos (vx, vy)
Z_values = zeros(size(vx));
velocidad = zeros(size(vx));

% Calcular Z en cada punto (vx, vy)
for i = 1:length(vx)
    Z_values(i) = subs(Z, [x, y], [vx(i), vy(i)]);
end

%%
figure;
% Crear el gráfico de curvas de nivel
contour(X, Y, Ze, 'LineWidth', 0.5);
colorbar; % Mostrar la barra de colores (valores de la función)

% Etiquetas de ejes y título
xlabel('x1');
ylabel('x2');
title('Curvas de Nivel de 2*x^2 + 5*y^2 + 2*x*y - 12*x - 8*y + 10');

% Agregar el recorrido del gráfico
hold on;
plot3(vx, vy, Z_values, '-','Color','k','Marker','>','MarkerEdgeColor','1.00,0.41,0.16','MarkerFaceColor','0.07,0.62,1.00','MarkerSize', 5,'LineWidth',1 );
hold off;

% Añadir un punto para resaltar el mínimo global
%hold on;
%plot3(x0(1), x0(2),subs(Z, [x, y], [x0(1), x0(2)]), '-','Color','k','Marker','>','MarkerEdgeColor','1.00,0.41,0.16','MarkerFaceColor','0.07,0.62,1.00','MarkerSize', 5,'LineWidth',1 );
%hold off;


