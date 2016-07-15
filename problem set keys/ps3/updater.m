function de = updater(t, e)
x = e(1);
y = e(2);
global a b c d
 dx = a*x + b*y;
 dy = c*x + d*y;
 de = [dx; dy];
end