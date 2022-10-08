function FV = startPos(H,p,X,opts,c0)

[cOut,~,~,exitFlag] = lsqnonlin(@(c) catSys(c,[X(1),H],p), c0, [-inf,-inf,0,0,-inf,-inf],[inf,inf,inf,inf,inf,inf], opts);

if exitFlag < 1
    error('Non-linear catenary solver has failed to find a solution')
end

FV = cOut(4)*sinh(p.W/cOut(4)*(X(1)-cOut(6))) - cOut(3)*sinh(p.W/cOut(3)*(X(1)-cOut(5))) - p.m*p.g;  %Vertical force acting on rider

end

