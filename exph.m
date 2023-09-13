function [outputArg1] = h(r)
outputArg1 = (exp(r-1) + exp(1-r)) / 2 + r^2/10;
end