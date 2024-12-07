data = readtable("data_30.csv");
t = data.t;
x1 = data.x1;
x2 = data.x2;
x3 = data.x3;
y1 = data.y1;
y2 = data.y2;
y3 = data.y3;
N = length(t);

dx1_forward = zeros(N,1);
dx1_central = zeros(N,1);
dx1_backward = zeros(N,1);

dx1_forward(1) = (x1(2) - x1(1)) / (t(2) - t(1));
for i=2:length(x1)-1
  dx1_forward(i)  = (x1(i+1) - x1(i)) / (t(i+1) - t(i));
  dx1_central(i)  = (x1(i+1) - x1(i-1)) / (t(i+1) - t(i-1));
  dx1_backward(i) = (x1(i) - x1(i-1)) / (t(i) - t(i-1));
end

[t, dx1_central, dx1_forward, dx1_backward]

figure(1); clf;
hold on; 
plot(x1,y1,DisplayName='Body 1');
plot(x2,y2,DisplayName='Body 2');
plot(x3,y3,DisplayName='Body 3');
legend("show")

figure(2)
subplot(2,3,1)
plot(t,x1)
title("x1");
subplot(2,3,2)
plot(t,x2)
title("x2");
subplot(2,3,3)
plot(t,x3)
title("x3");
subplot(2,3,4)
plot(t,y1)
title("y1");
subplot(2,3,5)
plot(t,y2)
title("y2");
subplot(2,3,6)
plot(t,y3)
title("y3");

figure(3)
subplot(3,2,1)
plot(t,x1)
title("x1");
subplot(3,2,3)
plot(t,x2)
title("x2");
subplot(3,2,5)
plot(t,x3)
title("x3");
subplot(3,2,2)
plot(t,y1)
title("y1");
subplot(3,2,4)
plot(t,y2)
title("y2");
subplot(3,2,6)
plot(t,y3)
title("y3");
