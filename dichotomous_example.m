function dichotomousExample
% Execute dichotomous search for the minimum of
% each of two specified functions. AJR, Nov 2016
f21=@(x) 1-exp(-x/2).*log(x/5)
dichotomous(f21,2,10,1)
f22=@(x) exp(x/5).*sin(x/5)
dichotomous(f22,-10,3,0.1)
end
function [xMin,fMin]=dichotomous(f,a,b,len)
% Dichotomous Search for the minimum of function
% f(x) over interval [a,b] to within final
% interval of length len. AJR, Mar 2017
nIterations=ceil(log(abs(b-a)/len)/log(2));
adceb=[a nan (a+b)/2 nan b];
fMin=f(adceb(3));
for k=1:nIterations
adceb([2 4])=(adceb([1 3])+adceb([3 5]))/2
fdce=[f(adceb(2)) fMin f(adceb(4))]
[fMin,j]=min(fdce);
adceb([1 3 5])=adceb(j:j+2);
end
xMin=adceb(3)
fMin=fMin
end%dichotomous
