function [XD] = zipRHS(X,p,c0,opts)

%Solve for shape of catenary on either side of rider
[cOut,~,~,exitFlag] = lsqnonlin(@(c) catSys(c,X,p) ,c0 ,[-inf,-inf,0,0,-inf,-inf],[inf,inf,inf,inf,inf,inf],opts);

if exitFlag < 1
    error('Non-linear catenary solver has failed to find a solution')
end

XD(1) = X(3);
XD(2) = X(4);
XD(3) = (cOut(4)-cOut(3) - p.Cd*X(3)*sqrt(X(3)^2+X(4)^2))/p.m;
XD(4) = (cOut(4)*sinh(p.W/cOut(4)*(X(1)-cOut(6))) - cOut(3)*sinh(p.W/cOut(3)*(X(1)-cOut(5))) - p.Cd*X(4)*sqrt(X(3)^2+X(4)^2) - p.m*p.g)/p.m;

end
