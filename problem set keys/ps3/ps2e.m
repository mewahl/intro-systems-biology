%(2)
%try a set of input n, such as n=5, n=10, n=20
n1=5;
n2=10;
n3=20;
u=0:0.01:5;

denom1 = ones(1,length(u));
denom2 = ones(1,length(u));
denom3 = ones(1,length(u));

for i=1:n1
   denom1 = denom1 + u.^i;
end
for i=1:n2
   denom2 = denom2 + u.^i;
end
for i=1:n3
   denom3 = denom3 + u.^i;
end

y1 = u.^n1 ./ denom1;
y2 = u.^n2 ./ denom2;
y3 = u.^n3 ./ denom3;

figure
plot(u,y1,'r',u,y2,'-g',u,y3,'-b'); hold on;
xlabel('u');
ylabel('[Sn]/[Stotal]');