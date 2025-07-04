function J = Criterium(p, t, data)
  Gm = p(13);

  % Zdefiniowanie rozwiązywanego URRZ
  odefun = @(t, z) ODEFunction(t, z, Gm);

  % Rozwiązanie URRZ za pomocą ode45
  opts = odeset('RelTol', 1e-9, 'AbsTol', 1e-9);
  [~, z] = ode45(odefun, t, p(1:12), opts);

  % Obliczenie błędu średniokwadratowego
  J = sum((z(:, 1:6) - data(:, 1:6)).^2, "all");

end % function