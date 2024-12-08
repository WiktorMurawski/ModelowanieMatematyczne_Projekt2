function J = crit(p,T,exact)
  
  Gm = p(13);
  % Define the system of equations
  odefun = @(t, z) odefunction(t, z, Gm);
  %odefun = @(t, z) three_body_ode(t, z, Gm);
  
  % Solve using ode45
  [T, z] = ode45(odefun, T, p(1:12), odeset('RelTol',3e-14,'AbsTol',3e-14));

  % Calculate sum of MSEs
  J = 0;
  for i = 1:6
    J = J + MSE(z(:,i), exact(:,i));
  end

end