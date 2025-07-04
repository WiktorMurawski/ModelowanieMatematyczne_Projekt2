function m = ApproximateMass(t, x1, x2, x3, y1, y2, y3)
  N = length(t);

  % Wygładzanie zaburzonych danych
  window_size = 3;
  for i = 1:5
    x1 = movmean(x1, window_size);
    x2 = movmean(x2, window_size);
    x3 = movmean(x3, window_size);
    y1 = movmean(y1, window_size);
    y2 = movmean(y2, window_size);
    y3 = movmean(y3, window_size);
  end

  % Przybliżanie wartości pierwszej pochodnej
  dx1 = ApproximateDerivative(t, x1);
  dy1 = ApproximateDerivative(t, y1);
  dx2 = ApproximateDerivative(t, x2);
  dy2 = ApproximateDerivative(t, y2);
  dx3 = ApproximateDerivative(t, x3);
  dy3 = ApproximateDerivative(t, y3);


  % Przybliżanie wartości drugiej pochodnej
  ddx1 = ApproximateDerivative(t, dx1);
  ddy1 = ApproximateDerivative(t, dy1);
  ddx2 = ApproximateDerivative(t, dx2);
  ddy2 = ApproximateDerivative(t, dy2);
  ddx3 = ApproximateDerivative(t, dx3);
  ddy3 = ApproximateDerivative(t, dy3);

  % Wyznaczenie macierzy przybliżonych wartości masy
  m_mat = zeros(N, 6);
  for i = 1:N
    r12 = sqrt((x1(i)-x2(i))^2 + (y1(i)-y2(i))^2);
    r13 = sqrt((x1(i)-x3(i))^2 + (y1(i)-y3(i))^2);
    r23 = sqrt((x2(i)-x3(i))^2 + (y2(i)-y3(i))^2);
    m_mat(i, 1) = ddx1(i)/((x2(i) - x1(i))/r12^3 + (x3(i) - x1(i))/r13^3);
    m_mat(i, 2) = ddy1(i)/((y2(i) - y1(i))/r12^3 + (y3(i) - y1(i))/r13^3);
    m_mat(i, 3) = ddx2(i)/((x3(i) - x2(i))/r23^3 + (x1(i) - x2(i))/r12^3);
    m_mat(i, 4) = ddy2(i)/((y3(i) - y2(i))/r23^3 + (y1(i) - y2(i))/r12^3);
    m_mat(i, 5) = ddx3(i)/((x1(i) - x3(i))/r13^3 + (x2(i) - x3(i))/r23^3);
    m_mat(i, 6) = ddy3(i)/((y1(i) - y3(i))/r13^3 + (y2(i) - y3(i))/r23^3);
  end
  
  % Zignorowanie wartości ze skrajów przedziału dla każdej zmiennej
  m_mat = abs(m_mat(10:N-9, 1:6));

  % Obliczenie wskaźnika odchylenia od średniej wartości wartości masy 
  % w kolumnie dla każdej kolumny
  mean_vals = zeros(1, 6);
  deviation = zeros(1, 6);
  for i = 1:6
    mean_vals(i) = median(m_mat(:, i));
    for j = 1:length(m_mat(:, i))
      deviation(i) = abs(sum(m_mat(:, i) - mean_vals(i)));
    end
  end

  % Wybranie kolumny z wartościami o najmniejszym odchyleniu
  [~, best_idx] = min(deviation);

  % Przypisanie do wartości zwracanej średniej arytm. z najlepszej kolumny
  m = mean(m_mat(:, best_idx));
  
end % function
