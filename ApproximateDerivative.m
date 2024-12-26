function dy = ApproximateDerivative(t, y)
  N = length(y);
  dy = zeros(N, 1);

  dy(1) = (y(2) - y(1)) / (t(2) - t(1)); % Różnica wprzód
  for n = 2:N-1
    dy(n) = (y(n+1) - y(n-1)) / (t(n+1) - t(n-1)); % Różnica środkowa
  end
  dy(N) = (y(N) - y(N-1)) / (t(N) - t(N-1)); % Różnica wstecz

end % function