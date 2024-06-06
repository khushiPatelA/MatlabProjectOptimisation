function xk=quadGradProj(H,f,A,b,xk)
% Gradient Projection Algorithm to minimise quadratic
% x'*H*x/2+f'*x such that A*x<=b starting from point
% xk. AJR, May 2018.
maxSteps=999; % max number of iterations
tiny=1e-9; % anything smaller is zero
if max(A*xk-b)>=tiny, error('Initial point not feasible'), end
Ik=find(abs(A*xk-b)<tiny)
for k=1:maxSteps
M=A(Ik,:);
if isempty(M), V0=1; else V0=null(M); end
gradf=H*xk+f;
uk=-V0*(V0'*gradf)
if norm(uk)>tiny
% find max possible feasible lambda
Auk=A*uk; i=find(Auk>tiny);
beta=min([(b(i)-A(i,:)*xk)./Auk(i);Inf])
% minimise quadratic in search direction
lambdak=min(-uk'*gradf/(uk'*H*uk),beta)
xk=xk+lambdak*uk % update position
Ik=find(abs(A*xk-b)<tiny)
else if isempty(M), nStepsTaken=k, return, end
disp('omit a constraint in tight/active set')
w=-M'\gradf;
[w,j]=min(w);
if w>-tiny, nStepsTaken=k, return, end
Ik(j)=[]
end
end
warning('too many iterations')
end