function dzdt = ODEFunction(~, z, Gm)
    x1 = z(1); y1 = z(2); 
    x2 = z(3); y2 = z(4); 
    x3 = z(5); y3 = z(6); 
    dx1 = z(7);  dy1 = z(8);
    dx2 = z(9);  dy2 = z(10);
    dx3 = z(11); dy3 = z(12);
    
    r12 = sqrt((x1 - x2)^2 + (y1 - y2)^2);
    r13 = sqrt((x1 - x3)^2 + (y1 - y3)^2);
    r23 = sqrt((x2 - x3)^2 + (y2 - y3)^2);
    
    ddx1 = Gm * ((x2 - x1)/r12^3 + (x3 - x1)/r13^3);
    ddy1 = Gm * ((y2 - y1)/r12^3 + (y3 - y1)/r13^3);
    ddx2 = Gm * ((x3 - x2)/r23^3 + (x1 - x2)/r12^3);
    ddy2 = Gm * ((y3 - y2)/r23^3 + (y1 - y2)/r12^3);
    ddx3 = Gm * ((x1 - x3)/r13^3 + (x2 - x3)/r23^3);
    ddy3 = Gm * ((y1 - y3)/r13^3 + (y2 - y3)/r23^3);
    
    dzdt = [ dx1;  dy1;  dx2;  dy2;  dx3;  dy3;
            ddx1; ddy1; ddx2; ddy2; ddx3; ddy3];

end % function