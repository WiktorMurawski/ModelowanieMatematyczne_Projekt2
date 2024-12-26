function dzdt = three_body_ode(t, z, Gm)
    % Unpack positions and velocities
    x1 = z(1); y1 = z(2); vx1 = z(7); vy1 = z(8);
    x2 = z(3); y2 = z(4); vx2 = z(9); vy2 = z(10);
    x3 = z(5); y3 = z(6); vx3 = z(11); vy3 = z(12);

    % Distances
    r12 = sqrt((x2 - x1)^2 + (y2 - y1)^2);
    r13 = sqrt((x3 - x1)^2 + (y3 - y1)^2);
    r23 = sqrt((x3 - x2)^2 + (y3 - y2)^2);

    % Accelerations
    ax1 = Gm * ((x2 - x1)/r12^3 + (x3 - x1)/r13^3);
    ay1 = Gm * ((y2 - y1)/r12^3 + (y3 - y1)/r13^3);

    ax2 = Gm * ((x3 - x2)/r23^3 + (x1 - x2)/r12^3);
    ay2 = Gm * ((y3 - y2)/r23^3 + (y1 - y2)/r12^3);
    
    ax3 = Gm * ((x1 - x3)/r13^3 + (x2 - x3)/r23^3);
    ay3 = Gm * ((y1 - y3)/r13^3 + (y2 - y3)/r23^3);

    % Return derivatives
    dzdt = [vx1; vy1; vx2; vy2; vx3; vy3; ax1; ay1; ax2; ay2; ax3; ay3];
end
