function [f, dx,dy] = funxy(ecuacion, variables)
    % Convertir las variables de texto en símbolos simbólicos
    x = str2sym(variables(1));
    y = str2sym(variables(2));
    r = str2sym(variables(3));

    % Convertir la ecuación de texto a una expresión simbólica
    f = sym(str2sym(ecuacion));

    % Calcular la derivada de la ecuación
    dx = -diff(f, x)*r;
    dy = -diff(f, y)*r;
    
    max = 1;
    
    A = [ 0 ];
    B = [ 0 ];
    R = [ 0 ];
    
    
    for iter = 1:max
        a = A(end) + dx;
        b = B(end) + dy;
    
        prim_eval = subs(f, [x, y], [a, b]);
        valor_evaluado = subs(prim_eval, [x, y], [A(end), B(end)]);
        resol = diff(valor_evaluado) == 0;
        %disp(resol)
        solucion = solve(resol, r);
        %disp(solucion)
        R = [ R  solucion];
    
        nuev_a = subs(a, [x,y,r], [A(end),B(end), R(end)]); %solo para la version analitica
        nuev_b = subs(b, [y,x, r], [B(end),A(end), R(end)]); %solo para la version analitica
        nuev_ec = subs(f, [x, y], [nuev_a, nuev_b]);
        fprintf ("El x para la funcion es %.2f\n", nuev_a )
        fprintf ("El y para la funcion es %.2f\n", nuev_b )
        %fprintf ("el nuevo minimo es %.2f\n", nuev_ec )

        %[a, b, m] = biparticion(0, 2, 1e-6, @(u) subs(diff(valor_evaluado,r), [r], [u]));
        %fprintf ("El mu optimo para la funcion es %d\n\n", m(end) )
        
        A = [ A nuev_a];
        B = [ B nuev_b];

    end
    
    
    
    
end