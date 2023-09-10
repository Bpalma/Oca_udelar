function [f, fp] = fun(ecuacion, variables)
    % Convertir las variables de texto en símbolos simbólicos
    sym_vars = str2sym(variables);

    % Convertir la ecuación de texto a una expresión simbólica
    f = sym(str2sym(ecuacion));

    % Calcular la derivada de la ecuación
    fp = diff(f, sym_vars);

    % Mostrar la ecuación y la derivada en la consola
    disp('Ecuación:');
    disp(f);

    disp('Derivada:');
    disp(fp);
end


