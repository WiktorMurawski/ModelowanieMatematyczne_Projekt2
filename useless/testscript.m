

for Gm = 0.1:0.01:0.2
  odefun = @(t, z) ODEFUN(t, z, Gm);

end