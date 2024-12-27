function [] = VisualizeDynamic(data, calc)
  x1_data = data(:, 1); y1_data = data(:, 2);
  x2_data = data(:, 3); y2_data = data(:, 4);
  x3_data = data(:, 5); y3_data = data(:, 6);
  x1_calc = calc(:, 1); y1_calc = calc(:, 2);
  x2_calc = calc(:, 3); y2_calc = calc(:, 4);
  x3_calc = calc(:, 5); y3_calc = calc(:, 6);

  c1 = "#0000FF";
  c2 = "#FF0000";
  c3 = "#00FF00";
  figure(1); clf; hold on;
  title('Problem trzech ciał');
  xlabel('x'); ylabel('y');
  axis equal;
  maxy = max(max([y1_calc, y2_calc, y3_calc]));
  miny = min(min([y1_calc, y2_calc, y3_calc]));
  maxx = max(max([x1_calc, x2_calc, x3_calc]));
  minx = min(min([x1_calc, x2_calc, x3_calc]));
  a = 1.05;
  ylim([a*miny, a*maxy]);  xlim([a*minx, a*maxx]);
  %set(gca, "Color", 'k')

  % Wyświetl pozycje początkowe z danych
  opts = {'LineStyle', 'none', 'Marker', 'o', 'MarkerSize', 24};
  plot(x1_data(1), y1_data(1), opts{:}, Color=c1, ...
    DisplayName='Obiekt 1 - Dane - Start');
  plot(x2_data(1), y2_data(1), opts{:}, Color=c2, ...
    DisplayName='Obiekt 2 - Dane - Start');
  plot(x3_data(1), y3_data(1), opts{:}, Color=c3, ...
    DisplayName='Obiekt 3 - Dane - Start');

  % Wyświetl pozycje z danych
  opts = {'LineStyle', 'none', 'Marker', 'o', 'MarkerSize', 6};
  plot(x1_data, y1_data, opts{:}, Color=c1, ...
    DisplayName='Obiekt 1 - Dane');
  plot(x2_data, y2_data, opts{:}, Color=c2, ...
    DisplayName='Obiekt 2 - Dane');
  plot(x3_data, y3_data, opts{:}, Color=c3, ...
    DisplayName='Obiekt 3 - Dane');

  % Wyświetl wyznaczone pozycje początkowe
  opts = {'LineStyle', 'none', 'Marker', '*', 'MarkerSize', 30};
  plot(x1_calc(1), y1_calc(1), opts{:}, Color=c1, ...
    DisplayName='Obiekt 1 Start');
  plot(x2_calc(1), y2_calc(1), opts{:}, Color=c2, ...
    DisplayName='Obiekt 2 Start');
  plot(x3_calc(1), y3_calc(1), opts{:}, Color=c3, ...
    DisplayName='Obiekt 3 Start');

  % Wyświetl wyznaczone pozycje dynamicznie
  opts = {'LineStyle', '-', 'Marker', '.', 'MarkerSize', 16};
  o1 = animatedline(opts{:}, Color=c1, ...
    DisplayName='Obiekt 1');
  o2 = animatedline(opts{:}, Color=c2, ...
    DisplayName='Obiekt 2');
  o3 = animatedline(opts{:}, Color=c3, ...
    DisplayName='Obiekt 3');

  legend("show", Interpreter="latex", Color="#FFFFFF", Location="bestoutside")

  N = length(x1_calc);
  for i = 1:N
      addpoints(o1, x1_calc(i), y1_calc(i));
      addpoints(o2, x2_calc(i), y2_calc(i));
      addpoints(o3, x3_calc(i), y3_calc(i));
      drawnow;
      pause(0.01);
  end % for i

end % function