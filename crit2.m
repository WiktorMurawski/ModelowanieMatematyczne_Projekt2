function J = crit2(p,T,exact)

  Gm = p(13);
  odefun = @(t, z) ODEFUN(t, z, Gm);
  [T, z] = ode45(odefun, T, p(1:12), odeset('RelTol',1e-10,'AbsTol',1e-10));

  for i = 1:6
    J = max(abs(z(:,i) - exact(:,i)))
  end

end