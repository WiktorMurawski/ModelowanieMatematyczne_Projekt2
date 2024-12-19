function [] = visualize(data,z)
  x1_data = data(:, 1);
  y1_data = data(:, 2);
  x2_data = data(:, 3);
  y2_data = data(:, 4);
  x3_data = data(:, 5);
  y3_data = data(:, 6);
  
  x1_calc = z(:, 1);
  y1_calc = z(:, 2);
  x2_calc = z(:, 3);
  y2_calc = z(:, 4);
  x3_calc = z(:, 5);
  y3_calc = z(:, 6);

  c1 = "#0000FF";
  c2 = "#FF0000";
  c3 = "#FFA000";
  figure(1); clf; hold on; 
  ylim([-0.66, 0.66]);
  xlim([-0.66, 0.66]);
  set(gca,'Color','k')

  opts = {'LineStyle','none','Marker','o','MarkerSize',6};
  plot(x1_data,y1_data,opts{:},Color=c1, ...
    DisplayName='Obiekt 1 - Dane');
  plot(x2_data,y2_data,opts{:},Color=c2, ...
    DisplayName='Obiekt 2 - Dane');
  plot(x3_data,y3_data,opts{:},Color=c3, ...
    DisplayName='Obiekt 3 - Dane');

  opts = {'LineStyle','none','Marker','o','MarkerSize',24};
  plot(x1_data(1),y1_data(1),opts{:},Color=c1, ...
    DisplayName='Obiekt 1 - Dane - Start');
  plot(x2_data(1),y2_data(1),opts{:},Color=c2, ...
    DisplayName='Obiekt 2 - Dane - Start');
  plot(x3_data(1),y3_data(1),opts{:},Color=c3, ...
    DisplayName='Obiekt 3 - Dane - Start');

  opts = {'LineStyle','--','Marker','.','MarkerSize',16};
  plot(x1_calc,y1_calc,opts{:},Color=c1, ...
    DisplayName='Obiekt 1');
  plot(x2_calc,y2_calc,opts{:},Color=c2, ...
    DisplayName='Obiekt 2');
  plot(x3_calc,y3_calc,opts{:},Color=c3, ...
    DisplayName='Obiekt 3');

  opts = {'LineStyle','none','Marker','*','MarkerSize',30};
  plot(x1_calc(1),y1_calc(1),opts{:},Color=c1, ...
    DisplayName='Obiekt 1 Start');
  plot(x2_calc(1),y2_calc(1),opts{:},Color=c2, ...
    DisplayName='Obiekt 2 Start');
  plot(x3_calc(1),y3_calc(1),opts{:},Color=c3, ...
    DisplayName='Obiekt 3 Start');

  title('Problem trzech ciał');
  xlabel('x'); ylabel('y');
  legend("show",Color="#FFFFFF",Location="northeast")
  
end % function