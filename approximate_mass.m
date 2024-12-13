function m = approximate_mass(x1, x2, x3, y1, y2, y3, t_vals)
    % Constants
    G = 1; % Gravitational constant
    N = length(t_vals);

    % window_size = 3;
    % method = 'movmean';
    % x1 = smoothdata(x1, method, window_size);
    % x2 = smoothdata(x2, method, window_size);
    % x3 = smoothdata(x3, method, window_size);
    % y1 = smoothdata(y1, method, window_size);
    % y2 = smoothdata(y2, method, window_size);
    % y3 = smoothdata(y3, method, window_size);

    %Smooth the position data (Savitzky-Golay filter)
    % x1 = sgolayfilt(x1, 2, 5); y1 = sgolayfilt(y1, 2, 5);
    % x2 = sgolayfilt(x2, 2, 5); y2 = sgolayfilt(y2, 2, 5);
    % x3 = sgolayfilt(x3, 2, 5); y3 = sgolayfilt(y3, 2, 5);

    window_size = 3;
    x1 = movmean(x1, window_size);
    x2 = movmean(x2, window_size);
    x3 = movmean(x3, window_size);
    y1 = movmean(y1, window_size);
    y2 = movmean(y2, window_size);
    y3 = movmean(y3, window_size);

    % window_size = 3;
    % x1 = movmean(x1, window_size);
    % x2 = movmean(x2, window_size);
    % x3 = movmean(x3, window_size);
    % y1 = movmean(y1, window_size);
    % y2 = movmean(y2, window_size);
    % y3 = movmean(y3, window_size);
    % 
    %     window_size = 3;
    % x1 = movmean(x1, window_size);
    % x2 = movmean(x2, window_size);
    % x3 = movmean(x3, window_size);
    % y1 = movmean(y1, window_size);
    % y2 = movmean(y2, window_size);
    % y3 = movmean(y3, window_size);

    % % Compute derivatives (central differences)
    % N = length(x1);
    % ddx1 = (x1(3:end) - 2*x1(2:end-1) + x1(1:end-2)) / h^2;
    % ddy1 = (y1(3:end) - 2*y1(2:end-1) + y1(1:end-2)) / h^2;
    % ddx2 = (x2(3:end) - 2*x2(2:end-1) + x2(1:end-2)) / h^2;
    % ddy2 = (y2(3:end) - 2*y2(2:end-1) + y2(1:end-2)) / h^2;
    % ddx3 = (x3(3:end) - 2*x3(2:end-1) + x3(1:end-2)) / h^2;
    % ddy3 = (y3(3:end) - 2*y3(2:end-1) + y3(1:end-2)) / h^2;
    % 

    option = 0;
    dx1 = ApproximateDerivative(t_vals,x1,option);
    dy1 = ApproximateDerivative(t_vals,y1,option);
    dx2 = ApproximateDerivative(t_vals,x2,option);
    dy2 = ApproximateDerivative(t_vals,y2,option);
    dx3 = ApproximateDerivative(t_vals,x3,option);
    dy3 = ApproximateDerivative(t_vals,y3,option);

    ddx1 = ApproximateDerivative(t_vals,dx1,option);
    ddy1 = ApproximateDerivative(t_vals,dy1,option);
    ddx2 = ApproximateDerivative(t_vals,dx2,option);
    ddy2 = ApproximateDerivative(t_vals,dy2,option);
    ddx3 = ApproximateDerivative(t_vals,dx3,option);
    ddy3 = ApproximateDerivative(t_vals,dy3,option);

    % Compute distances (excluding boundaries)
    r12 = sqrt((x1(2:end-1) - x2(2:end-1)).^2 + (y1(2:end-1) - y2(2:end-1)).^2);
    r13 = sqrt((x1(2:end-1) - x3(2:end-1)).^2 + (y1(2:end-1) - y3(2:end-1)).^2);
    r23 = sqrt((x2(2:end-1) - x3(2:end-1)).^2 + (y2(2:end-1) - y3(2:end-1)).^2);
    
    % Preallocate for mass values
    m_values = zeros(3, N-2);
    
    % Compute forces and approximate mass
    for k = 1:N-2
        Fx1 = -G * ((x1(k+1) - x2(k+1)) / r12(k)^3 + (x1(k+1) - x3(k+1)) / r13(k)^3);
        Fy1 = -G * ((y1(k+1) - y2(k+1)) / r12(k)^3 + (y1(k+1) - y3(k+1)) / r13(k)^3);
        m_values(1, k) = ddx1(k) / Fx1;
        m_values(1, k) = ddy1(k) / Fy1;
        
        Fx2 = -G * ((x2(k+1) - x1(k+1)) / r12(k)^3 + (x2(k+1) - x3(k+1)) / r23(k)^3);
        Fy2 = -G * ((y2(k+1) - y1(k+1)) / r12(k)^3 + (y2(k+1) - y3(k+1)) / r23(k)^3);
        m_values(2, k) = ddx2(k) / Fx2;
        m_values(2, k) = ddy2(k) / Fy2;
        
        Fx3 = -G * ((x3(k+1) - x1(k+1)) / r13(k)^3 + (x3(k+1) - x2(k+1)) / r23(k)^3);
        Fy3 = -G * ((y3(k+1) - y1(k+1)) / r13(k)^3 + (y3(k+1) - y2(k+1)) / r23(k)^3);
        m_values(3, k) = ddx3(k) / Fx3;
        m_values(3, k) = ddy3(k) / Fy3;
    end
    
    % Compute the median value to reduce outlier influence
    m = median(m_values(:), 'omitnan');
end
