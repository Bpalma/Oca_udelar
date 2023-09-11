function [f, dx,dy] = fun(ecuacion, variables)
    % Convertir las variables de texto en símbolos simbólicos
    x = str2sym(variables(1));
    y = str2sym(variables(2));
    r = str2sym(variables(3))

    % Convertir la ecuación de texto a una expresión simbólica
    f = sym(str2sym(ecuacion));

    % Calcular la derivada de la ecuación
    dx = -diff(f, x)*r;
    dy = -diff(f, y)*r;

    % Mostrar la ecuación y la derivada en la consola
    disp('Ecuación:');
    disp(f);

    disp('Derivada:');
    disp(dx);
    disp(dy);
    
    %inicial

    a = 0 + dx ;
    b = 0 + dy ;

    prim_eval = subs(ecuacion, [x, y], [a, b]);
    disp(prim_eval)

    
    
    
end


