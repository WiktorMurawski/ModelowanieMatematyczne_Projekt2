function result = Projekt2()
  % Wczytanie danych pomiarowych
  data = readtable("data_30.csv");
  t_data = data.t;
  x1 = data.x1; y1 = data.y1;
  x2 = data.x2; y2 = data.y2;
  x3 = data.x3; y3 = data.y3;
  data = [x1, y1, x2, y2, x3, y3];

  % Wczytanie wartości czasu
  data2 = readtable("query_30.csv");
  t_query = data2.t;
 
  % Przybliżenie początkowych wartości pochodnych
  dx1 = ApproximateDerivative(t_query, x1);
  dy1 = ApproximateDerivative(t_query, y1);
  dx2 = ApproximateDerivative(t_query, x2);
  dy2 = ApproximateDerivative(t_query, y2);
  dx3 = ApproximateDerivative(t_query, x3);
  dy3 = ApproximateDerivative(t_query, y3);

  % Przybliżenie początkowe masy
  Gm = ApproximateMass(t_data, x1, x2, x3, y1, y2, y3);
  % Gm = 0.361115455784322; % Najlepsza znaleziona masa, delta = 0.0169

  % Warunki początkowe
  p0 = [ x1(1);  y1(1);  x2(1);  y2(1);  x3(1);  y3(1); 
        dx1(1); dy1(1); dx2(1); dy2(1); dx3(1); dy3(1); Gm];

  % Minimalizacja
  opts = optimset('TolX', 1e-6, 'TolFun', 1e-6, ...
                  'MaxIter', 1e4, 'MaxFunEvals', 1e4);
  pmin = fminsearch(@(p) Criterium(p, t_data, data), p0, opts);
  
  % Zdefiniowanie rozwiązywanego URRZ
  odefun = @(t, z) ODEFunction(t, z, Gm);
  
  % Rozwiązanie URRZ za pomocą ode45
  opts = odeset('RelTol', 1e-12, 'AbsTol', 1e-12);
  [~, z] = ode45(odefun, t_query, pmin(1:12), opts);
  
  % Przypisanie wyznaczonych wartości x1, y1, x2, y2, x3, y3 w zadanych chwilach
  x1 = z(:, 1); y1 = z(:, 2);
  x2 = z(:, 3); y2 = z(:, 4);
  x3 = z(:, 5); y3 = z(:, 6);
  result = [x1, y1, x2, y2, x3, y3];

  % Wizualizacja orbit
  Visualize(data, result)

  % Wyświetlenie wyniku testu dokładności
  test_solution_30(x1, y1, x2, y2, x3, y3);
 
end % function
