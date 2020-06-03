y1o = 1;
y2o = 0;


y1prime = @ (x, y) 2 - exp(-4*x) - 2*y;
y2prime = @ (x, y) y - 1/2 * exp(x/2) .* sin(5*x) + 5 * exp(x/2) .* cos(5*x);

y1Sol = @(x) 1 + (exp(-4*x)-exp(-2*x))/2;
y2Sol = @(x) exp(x/2) .* sin(5*x);

finalX = input('Enter the x value of the point you wish to approximate: ');

steps = input('Enter how many steps you want the computer to take in approximating the solution: ');

X = linspace(0, finalX, steps + 1);

y1Euler = linspace(y1o, y1o, steps + 1);
y2Euler = linspace(y2o, y2o, steps + 1);

y1Analytical = y1Sol(X);
y2Analytical = y2Sol(X);

[ode45X1, ode45Y1] = ode45(y1prime, [0 finalX], y1o);
[ode45X2, ode45Y2] = ode45(y2prime, [0 finalX], y2o);

y1Midpoint = linspace(y1o, y1o, steps + 1);
y2Midpoint = linspace(y2o, y2o, steps + 1);

y1Backward = linspace(y1o, y1o, steps + 1);
y2Backward = linspace(y2o, y2o, steps + 1);

stepSize = finalX/steps;

% For repeated calculations (Euler's Method, Midpoint Method, etc...
for i = 2:size(X')
    % Perform Euler's Method calculation of points in X
    [y1Euler(i), y2Euler(i)] = calculateYValuesEuler(X(i-1), y1Euler(i-1), y2Euler(i-1), stepSize);
    
    % Perform Backward Euler Method calculation of points in X.
    [y1Backward(i), y2Backward(i)] = calculateYValuesBackwardEuler(X(i-1), y1Backward(i-1), y2Backward(i-1), stepSize);
    
    % Perform Midpoint Euler Method calculation of points in X.
    [y1Midpoint(i), y2Midpoint(i)] = calculateYValuesMidpointEuler(X(i-1), y1Midpoint(i-1), y2Midpoint(i-1), stepSize);
end

clf
hold on
subplot(1,2,1);
plot(X, y1Euler, 'r-', X, y1Analytical, 'b-', X, y1Midpoint, 'm-', ode45X1, ode45Y1, 'g-', X, y1Backward, 'k-');
subplot(1,2,2);
plot(X, y2Euler, 'r-', X, y2Analytical, 'b-', X, y2Midpoint, 'm-', ode45X2, ode45Y2, 'g-', X, y2Backward, 'k-');
hold off
