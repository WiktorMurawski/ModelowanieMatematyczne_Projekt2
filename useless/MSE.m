function err = MSE(x,y)

N = length(x);
err = 0;
for i = 1:N
  err = err + (x(i)-y(i))^2;
end
err = err/N;

end % function