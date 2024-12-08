function dzdt = odefunction(t, p, Gm)
    % Extract positions and velocities from the vector p
    x1 = p(1); y1 = p(2); 
    x2 = p(3); y2 = p(4); 
    x3 = p(5); y3 = p(6); 
    vx1 = p(7); vy1 = p(8);
    vx2 = p(9); vy2 = p(10);
    vx3 = p(11); vy3 = p(12);
    
    % Calculate the distances between the bodies
    r12 = sqrt((x1 - x2)^2 + (y1 - y2)^2);
    r13 = sqrt((x1 - x3)^2 + (y1 - y3)^2);
    r23 = sqrt((x2 - x3)^2 + (y2 - y3)^2);
    
    % Compute the accelerations for each body
    ax1 = Gm * ((x2 - x1)/r12^3 + (x3 - x1)/r13^3);
    ay1 = Gm * ((y2 - y1)/r12^3 + (y3 - y1)/r13^3);
    
    ax2 = Gm * ((x3 - x2)/r23^3 + (x1 - x2)/r12^3);
    ay2 = Gm * ((y3 - y2)/r23^3 + (y1 - y2)/r12^3);
    
    ax3 = Gm * ((x1 - x3)/r13^3 + (x2 - x3)/r23^3);
    ay3 = Gm * ((y1 - y3)/r13^3 + (y2 - y3)/r23^3);
    
    % Return the derivatives (velocities and accelerations)
    dzdt = [vx1;vy1;vx2;vy2;vx3;vy3;ax1;ay1;ax2;ay2;ax3;ay3];
end
