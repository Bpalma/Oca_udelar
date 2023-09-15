function [X,Y,x_min, f_min, iter] = steepestDescentWolfe(x0, tol)
    % Función objetivo
    f = @(x) (1 - x(1))^2 + 100 * (x(2) - x(1)^2)^2;
    
    % Gradiente de la función objetivo
    grad_f = @(x) [-2*(1 - x(1)) - 400*x(1)*(x(2) - x(1)^2); 200*(x(2) - x(1)^2)];
    
    % Parámetros de la Regla de Wolfe
    c1 = 0; % Condición de Armijo
    c2 = 0.9; % Curvatura suficiente

    x = x0;
    X = [];
    Y = [];
    iter = 0;
    
    while true
        
        % Cálculo del paso usando la Regla de Wolfe
        alpha = 1; % Longitud inicial del paso
        while true
            x_new = x - alpha * grad_f(x);
            if f(x_new) <= f(x) + c1 * alpha * grad_f(x)' * grad_f(x)
                if grad_f(x_new)' * grad_f(x) >= c2 * grad_f(x)' * grad_f(x)
                    break;
                end
            end
            alpha = alpha / 2; % Reducir el tamaño del paso
        end

        % Actualizar la solución y el valor de la función
        x = x_new;
        f_val = f(x);

        % Verificar la condición de convergencia
        if norm(grad_f(x)) < tol
            break;
        end
        X =[X,x(1)];
        Y =[Y,x(2)];
        iter = iter + 1;
    end
    
    x_min = x;
    f_min = f_val;
end


