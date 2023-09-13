function [error] = errMu(S, mu) %error, 
  t = [1/365:1/365:100]';
  Z = sum((exp (mu * sin(2 * pi * t)) - S(2:size(S,1))/S(1)).^2);
  error = (1 / (size(S,1) - 1)) * Z;
  
  %Z1 = sum (2 * sin(2 * pi * t) .* exp (2 * mu * sin(2 * pi * t)));
  %Z2 = sum (2 * sin(2 * pi * t) .* (S(2:size(S,1))/S(1)) .* exp (mu * sin(2 * pi * t)));
  %derr = (1 / (size(S,1) - 1)) * (Z1 - Z2);
  
end
