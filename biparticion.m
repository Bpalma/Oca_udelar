%--------------------------------------------------------------------------
% Biparticion
% (c) carlos@cagnazzo.uy 20230820
%
% Parametros: [a0, b0] intervalo de biseccion
%             error: tolerancia de error
%             fun: referencia a la funcion que queremos minimizar@
%
%--------------------------------------------------------------------------

%% por ahora asumo que la funcion a encontrar su cero se llama f1

function [A, B, R] = biparticion(a0, b0, error, fun)

  r0 = (a0+b0) / 2;

  A = [ a0 ];
  B = [ b0 ];
  R = [ r0 ];

  while ( abs(fun(R(end))) > error )

    d = fun(A(end))*fun(R(end));

    if ( d<0 )
      anp1 = A(end);
      bnp1 = R(end);
    end

    if ( d>0 )
      anp1 = R(end);
      bnp1 = B(end);
    end

    A = [A anp1];
    B = [B bnp1];
    R = [R (anp1 + bnp1)/2];

  end

end
