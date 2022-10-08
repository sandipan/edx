function F = catSys(c,x,p)
% Solve system of 6 equations to get shape of left and right catenaries
% Catenary solution:  y(x)=A+(Tx/W)cosh(W*(x-x0)/Tx)
% C = [A1,A2,Tx1,Tx2,x1,x2]

F(1) = c(1) + c(3)/p.W * cosh(p.W*c(5)/c(3)) - p.H; %Left cat. must satisfy left BC
F(2) = c(2) + c(4)/p.W * cosh(p.W*(p.D-c(6))/c(4)); %Right cat. must satisfy right BC
F(3) = c(1) + c(3)/p.W * cosh(p.W*(x(1)-c(5))/c(3)) - x(2) ;  %Rider must be on left catenary
F(4) = c(2) + c(4)/p.W * cosh(p.W*(x(1)-c(6))/c(4)) - x(2) ;  %Rider must be on right catenary
F(5) = ( c(3)*( sinh(p.W/c(3)*(x(1)-c(5)))+sinh(p.W/c(3)*c(5)) ) + c(4)*( sinh(p.W/c(4)*(p.D-c(6)))-sinh(p.W/c(4)*(x(1)-c(6))) ) )/p.W - p.arc; %Conservation of arc length
F(6) = c(3)*cosh(p.W*(x(1)-c(5))/c(3))-c(4)*cosh(p.W*(x(1)-c(6))/c(4)); %Torque balance on pulley (no friction)

end

