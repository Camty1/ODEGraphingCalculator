function [y1, y2] = calculateYValuesMidpointEuler(prevX, prevY1, prevY2, stepSize)
%calculateYValuesMidpointEuler Uses Midpoint Euler Method to calculate next y values.
%   The Midpoint Euler Method is: y_{i} = y_{i-1} + h * y'(x_{i-1} + h/2,
%   h/2*y'(x_{i-1}, y_{i-1})).  This function takes the previous x, the
%   previous y's, and the step size as inputs.  It then calculates the y
%   values for both equations.

    % Declare differential equations.
    y1prime = @ (x, y) 2 - exp(-4*x) - 2*y;
    y2prime = @ (x, y) y - 1/2 * exp(x/2) .* sin(5*x) + 5 * exp(x/2) .* cos(5*x);
    
    % Calculate y values
    y1 = prevY1 + stepSize * y1prime(prevX + 1/2 * stepSize, prevY1 + 1/2 * stepSize * y1prime(prevX, prevY1));
    y2 = prevY2 + stepSize * y2prime(prevX + 1/2 * stepSize, prevY2 + 1/2 * stepSize * y2prime(prevX, prevY2));
end