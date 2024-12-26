function ddx = ApproximateSecondDerivative(t, x, option)
% Funkcja przybliżająca wartość drugiej pochodnej w punktach t dla 
% funkcji x, której wartości są znane w punktach t.
% WEJŚCIE:
% t - wektor zawierający wartości czasu, w których znane są wartości x
% x - wektor wartości x
% option - przyjmuje wartości -0, 1 lub -1; 
%          dla  0 oblicza pochodną metodą różnicy środkowej
%          dla  1 oblicza pochodną metodą różnicy wprzód
%          dla -1 oblicza pochodną metodą różnicy wstecz

N = length(x);
ddx = zeros(N,1);
%dx(1) = (x(2) - x(1)) / (t(2) - t(1));
for n = 3:N-2
  ddx(n) = (x(n+2)-x(n))/(t(n+2)-t(n)) - (x(n)-x(n-2))/(t(n)-t(n-2)); 
  ddx(n) = ddx(n) / (t(n+1) - t(n-1));
end
%dx(N) = (x(N) - x(N-1)) / (t(N) - t(N-1));

end % function