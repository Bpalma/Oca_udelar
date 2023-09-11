%%
m = 0.1;

S= importdata('aptsHUY1.txt');
mpri = 0.9;

tg = 0;
td = 1;

h(0)
%%
syms r
while h(td) < h(0) + m * subs(diff(h(r)),r,0) * td
    td = 2*td;
    
    t = (tg+td)/2;
    if h(t) <= h(0) + m * subs(diff(h(r)),r,0) * t
        if subs(diff(h(r)),r,t) >= subs(diff(h(r)),r,0) * mpri
            disp(t);
        else
            tg = t;
        end
    else
        td = t;
    
    end
        
end