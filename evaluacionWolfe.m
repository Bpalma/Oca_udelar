clc, clearvars, close all
format short

% Llamar a la función de optimización
x0 = [-1.5; 3]; % Punto inicial
tolerancia = 1e-6; % Tolerancia de convergencia
[X,Y,x_min, f_min, iter] = steepestDescentWolfe(x0, tolerancia);

% Mostrar resultados
fprintf('Solución encontrada:\n');
fprintf('x = %.6f, y = %.6f\n', x_min(1), x_min(2));
fprintf('Valor mínimo de la función: %.6f\n', f_min);
fprintf('Iteraciones: %d\n', iter);



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
