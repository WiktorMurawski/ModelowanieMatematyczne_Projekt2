function J = crit(p,T,exact)
  
  Gm = p(13);
  % Define the system of equations
  odefun = @(t, z) ODEFUN(t, z, Gm);
  
  % Solve using ode45
  [T, z] = ode45(odefun, T, p(1:12), odeset('RelTol',1e-12,'AbsTol',1e-12));
  
  % Calculate sum of MSEs
  J = 0;
  for i = 1:6
    J = J + MSE(z(i), exact(i));
  end

end