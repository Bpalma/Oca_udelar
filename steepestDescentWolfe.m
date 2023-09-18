function [X,Y,x_min, f_min, iter] = steepestDescentWolfe(x0, tol)
    % Función objetivo
    f = @(x)  2*x(1)^2 + 5*x(2)^2 + 2*x(1)*x(2) - 12*x(1) - 8*x(2) +10; %@(x) (1 - x(1))^2 + 100 * (x(2) - x(1)^2)^2; 
    
    % Gradiente de la función objetivo
    grad_f = @(x) [4*x(1) + 2*x(2) - 12; 2*x(1) + 10*x(2) - 8]; %@(x) [-2*(1 - x(1)) - 400*x(1)*(x(2) - x(1)^2); 200*(x(2) - x(1)^2)]; 
    
    % Parámetros de la Regla de Wolfe
    c1 = 0.1; %0 para la rosenbrock
    c2 = 0.8; %0.9 para la rosenbrock

    x = x0;
    X = [x0(1)];
    Y = [x0(2)];
    iter = 0;
    
    while true
        
        % Cálculo del paso usando la Regla de Wolfe
        alpha = 1; % Longitud inicial del paso
        while true
            x_new = x - alpha * grad_f(x);
            if f(x_new) <= f(x) + c1 * alpha * grad_f(x)' * grad_f(x)
                if grad_f(x_new)' * grad_f(x_new) >= c2 * grad_f(x)' * grad_f(x)
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

%% 
