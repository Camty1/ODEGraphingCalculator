function [y1, y2] = calculateYValuesEuler(prevX, prevY1, prevY2, stepSize)
%CalculateYValuesEuler Uses Euler's Method to calculate next y values.
%   Euler's Method is: y_{i} = y_{i-1} + h * y'(x_{i-1}, y_{i-1}). This 
%   function takes the previous x value, the two previous y values and the
%   step size, and then calculates the next y values for both equations.
    
    % Define differential equations
    y1prime = @ (x, y) 2 - exp(-4*x) - 2*y;
    y2prime = @ (x, y) y - 1/2 * exp(x/2) .* sin(5*x) + 5 * exp(x/2) .* cos(5*x);

    % Calculate y values
    y1 = prevY1 + stepSize * y1prime(prevX, prevY1);
    y2 = prevY2 + stepSize * y2prime(prevX, prevY2);
end