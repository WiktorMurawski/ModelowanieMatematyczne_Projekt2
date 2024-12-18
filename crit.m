function J = crit(p,T,exact)

  Gm = p(13);
  odefun = @(t, z) odefunction(t, z, Gm);

  % Solve using ode45
  opts = odeset('RelTol',1e-9,'AbsTol',1e-9);
  [~, z] = ode45(odefun, T, p(1:12), opts);

  % Calculate sum of MSEs
  J = mean((z(:,1:6) - exact(:,1:6)).^2, 'all');

end % function