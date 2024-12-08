function dx = ApproximateDerivative(t, x, option)
% Funkcja przybliżająca wartość pochodnej w punktach t dla funkcji x,
% której wartości są znane w punktach t.
% WEJŚCIE:
% t - wektor zawierający wartości czasu, w których znane są wartości x
% x - wektor wartości x
% option - przyjmuje wartości -0, 1 lub -1; 
%          dla  0 oblicza pochodną metodą różnicy środkowej
%          dla  1 oblicza pochodną metodą różnicy wprzód
%          dla -1 oblicza pochodną metodą różnicy wstecz

if nargin < 3
  option = 0;
end

N = length(x);
dx = zeros(N,1);
dx(1) = (x(2) - x(1)) / (t(2) - t(1));
for n = 2:N-1
  if option > 0 % Wzór różnicy wprzód
    dx(n) = (x(n+1) - x(n)) / (t(n+1) - t(n));
  elseif option < 0 % Wzór różnicy wstecz
    dx(n) = (x(n) - x(n-1)) / (t(n) - t(n-1));
  else % Wzór różnicy środkowej
    dx(n) = (x(n+1) - x(n-1)) / (t(n+1) - t(n-1));
  end
end
dx(N) = (x(N) - x(N-1)) / (t(N) - t(N-1));

end % function