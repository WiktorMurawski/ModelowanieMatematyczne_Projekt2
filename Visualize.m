function [] = Visualize(data, calc)
  x1_data = data(:, 1); y1_data = data(:, 2);
  x2_data = data(:, 3); y2_data = data(:, 4);
  x3_data = data(:, 5); y3_data = data(:, 6);
  x1_calc = calc(:, 1); y1_calc = calc(:, 2);
  x2_calc = calc(:, 3); y2_calc = calc(:, 4);
  x3_calc = calc(:, 5); y3_calc = calc(:, 6);

  c1 = "#0000FF";
  c2 = "#FF0000";
  c3 = "#00FF00";
  figure(Name='Projekt2_30'); clf; hold on;
  title('Problem trzech ciał', FontSize=16);
  xlabel('x'); ylabel('y');
  axis equal;
  maxy = max(max([y1_calc, y2_calc, y3_calc]));
  miny = min(min([y1_calc, y2_calc, y3_calc]));
  maxx = max(max([x1_calc, x2_calc, x3_calc]));
  minx = min(min([x1_calc, x2_calc, x3_calc]));
  a = 1.05;
  ylim([a*miny, a*maxy]);  xlim([a*minx, a*maxx]);
  %set(gca, "Color", 'k')

  % Wyświetl położenia początkowe z danych
  opts = {'LineStyle', 'none', 'Marker', 'o', 'MarkerSize', 24};
  plot(x1_data(1), y1_data(1), opts{:}, Color=c1, ...
    DisplayName='Obiekt 1 - Dane - Położenie początkowe');
  plot(x2_data(1), y2_data(1), opts{:}, Color=c2, ...
    DisplayName='Obiekt 2 - Dane - Położenie początkowe');
  plot(x3_data(1), y3_data(1), opts{:}, Color=c3, ...
    DisplayName='Obiekt 3 - Dane - Położenie początkowe');

  % Wyświetl położenia z danych
  opts = {'LineStyle', 'none', 'Marker', 'o', 'MarkerSize', 6};
  plot(x1_data, y1_data, opts{:}, Color=c1, ...
    DisplayName='Obiekt 1 - Dane');
  plot(x2_data, y2_data, opts{:}, Color=c2, ...
    DisplayName='Obiekt 2 - Dane');
  plot(x3_data, y3_data, opts{:}, Color=c3, ...
    DisplayName='Obiekt 3 - Dane');

  % Wyświetl wyznaczone położenia początkowe
  opts = {'LineStyle', 'none', 'Marker', '*', 'MarkerSize', 30};
  plot(x1_calc(1), y1_calc(1), opts{:}, Color=c1, ...
    DisplayName='Obiekt 1 - Położenie początkowe');
  plot(x2_calc(1), y2_calc(1), opts{:}, Color=c2, ...
    DisplayName='Obiekt 2 - Położenie początkowe');
  plot(x3_calc(1), y3_calc(1), opts{:}, Color=c3, ...
    DisplayName='Obiekt 3 - Położenie początkowe');

  % Wyświetl wyznaczone położenia
  opts = {'LineStyle', '-', 'Marker', '.', 'MarkerSize', 16};
  plot(x1_calc, y1_calc, opts{:}, Color=c1, ...
    DisplayName='Obiekt 1');
  plot(x2_calc, y2_calc, opts{:}, Color=c2, ...
    DisplayName='Obiekt 2');
  plot(x3_calc, y3_calc, opts{:}, Color=c3, ...
    DisplayName='Obiekt 3');

  legend('show', Color='#FFFFFF', Location='southoutside', ...
    NumColumns=2, fontsize=14, box='off');

end % function