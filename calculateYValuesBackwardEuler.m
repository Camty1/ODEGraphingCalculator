function [y1, y2] = calculateYValuesBackwardEuler(prevX,prevY1, prevY2, stepSize)
%calculateYValuesBackwardEuler Uses backward Euler Method to calculate next y values.
%   Backward Euler Method is: y_{i+1} = y_{i} + h * y'(x_{i+1}, y_{i+i}).
%   y_{i+1} can be solved for algebraically with both ode's, only needing 
%   previous x, previous y's, and h as inputs.  x_{i+1} = x_{i} + h.  This
%   function calculates and returns the y values for both equations.

    % Increse x by one step.
    x = prevX + stepSize;
    
    % Calculate y1 and y2.
    y1 = (prevY1 + stepSize * (2 - exp(-4*x)))/(1+2 * stepSize);
    y2 = (prevY2 + stepSize * exp(x/2)*(5*cos(5*x) - 1/2 * sin(5*x)))/(1 - stepSize);
end