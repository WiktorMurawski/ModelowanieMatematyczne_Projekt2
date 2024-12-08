function err = compute_error(params, t_obs, x_obs, y_obs)
    x1_0 = params(1); y1_0 = params(2);
    x2_0 = params(3); y2_0 = params(4);
    x3_0 = params(5); y3_0 = params(6);
    Gm = params(7);
    vx1_0 = params(8);  vy1_0 = params(9);
    vx2_0 = params(10); vy2_0 = params(11);
    vx3_0 = params(12); vy3_0 = params(13);

    % Solve the ODE system with initial parameters
    init_cond = [x1_0, y1_0, x2_0, y2_0, x3_0, y3_0, ...
                 vx1_0, vy1_0, vx2_0, vy2_0, vx3_0, vy3_0];
    [t_sim, sol] = ode45(@(t, z) three_body_ode(t, z, Gm), t_obs, init_cond);

    % Extract simulated positions
    x_sim = sol(:, [1 3 5]);  % Simulated x positions
    y_sim = sol(:, [2 4 6]);  % Simulated y positions

    % Compute the squared error
    err = sum((x_sim - x_obs).^2 + (y_sim - y_obs).^2, 'all');
end
