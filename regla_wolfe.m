%--------------------------------------------------------------------------
% Regla de Wolfe
% Bernardo 20230909
%
% Parametros: [a0, b0] parametros de inicio de la regla de wolfe
%             error: tolerancia de error
%             fun: referencia a la funcion que queremos minimizar@
%
%--------------------------------------------------------------------------
function [A, B, T] = regla_wolfe(a0, b0, fun,derr)
  
  t0 = (a0+b0) / 2;
  
  A = [ a0 ];
  B = [ b0 ];
  T = [ t0 ];
  
  max = 10;
  m = 0.1;
  mpri = 0.5;
  %prueba a ver si funciona lo del lambda
  for iter = 1:max
      if fun(B(end))< fun(0) + m* derr(0) * B(end)
            anp1 = A(end);
            bnp1 = 2* B(end);
            T = [T (anp1 + bnp1)/2];
            %disp(fun(B(end)));
            %disp(fun(0) + m* derr(0) * B(end));
            
            if derr(B(end)) >= mpri* derr(0)
                %disp(derr(B(end)));
                %disp(mpri* derr(0));
                return
            end
            
            if derr(B(end)) < mpri* derr(0)
                anp1 = T(end);
            end
      end
        
      if fun(B(end)) >= fun(0) + m* derr(0) * B(end)
          anp1 = A(end);
          bnp1 = T(end);  
      end
      A = [A anp1];
      B = [B bnp1];
  end
end
            
