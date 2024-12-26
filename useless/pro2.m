% Observed data: times (t_obs), positions (x_obs, y_obs)
% Initial guesses for parameters
data = readtable("data_30.csv");
t_vals = data.t;
x1 = data.x1;
x2 = data.x2;
x3 = data.x3;
y1 = data.y1;
y2 = data.y2;
y3 = data.y3;
N = length(t_vals);

h = t_vals(2) - t_vals(1);
dx1 = (x1(2) - x1(1))/h;
dx2 = (x2(2) - x2(1))/h;
dx3 = (x3(2) - x3(1))/h;
dy1 = (y1(2) - x1(1))/h;
dy2 = (y2(2) - y2(1))/h;
dy3 = (y3(2) - y3(1))/h;

t_obs = t_vals;
x_obs = [x1,x2,x3];
y_obs = [y1,y2,y3];
Gm = 0.18;

%params0 = [x1_0, y1_0, x2_0, y2_0, x3_0, y3_0, Gm_0];
params0 = [x1(1), y1(1), x2(1), y2(1), x3(1), y3(1), Gm,...
             dx1,   dy1,   dx2,   dy2,   dx3,   dy3];

% Define the error function
objective = @(params) compute_error(params, t_obs, x_obs, y_obs);

% Optimize parameters
options = optimoptions('lsqnonlin', 'Display', 'iter', 'TolFun', 1e-6);
params_opt = lsqnonlin(objective, params0, [], [], options);

% Extract optimized values
x1_0_opt = params_opt(1); y1_0_opt = params_opt(2);
x2_0_opt = params_opt(3); y2_0_opt = params_opt(4);
x3_0_opt = params_opt(5); y3_0_opt = params_opt(6);
Gm_opt = params_opt(7);

disp('Optimized Parameters:');
disp(['x1_0 = ', num2str(x1_0_opt), ', y1_0 = ', num2str(y1_0_opt)]);
disp(['x2_0 = ', num2str(x2_0_opt), ', y2_0 = ', num2str(y2_0_opt)]);
disp(['x3_0 = ', num2str(x3_0_opt), ', y3_0 = ', num2str(y3_0_opt)]);
disp(['Gm = ', num2str(Gm_opt)]);
