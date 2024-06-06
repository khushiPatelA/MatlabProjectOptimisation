% AJR example from Opt III notes

gradf=@(i,x) 2*(x+3-2*i);
x(1)=2;

for k=1:99
  i=randi(2,1);
  x(k+1)=x(k)-0.04*gradf(i,x(k));
end

clf()
plot(x,'o-')
ylabel('x_k')
xlabel('k')
