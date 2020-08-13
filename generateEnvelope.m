% Create an envelope curve by specifying the number of number of points,
% the min and max values, the order (3 is good for most purposes), direction,
% and concavity (1 for concave up, -1 for concave down)
function y = generateEnvelope(numPoints, minVal, maxVal, order, dir, concavity)
    % input vector
    x = [1:numPoints]/numPoints;

    % alpha value
    a = 1 - 10^(-concavity*order);
    
    % get output
    if dir == 1 % value is increasing
        y = (1/a - 1) * ((1/(1-a)).^x - 1);
    elseif dir == -1 % value is decreasing
        y = (1/a - 1) * ((1/(1-a)).^(1-x) - 1);
    end
    
    y = y.*(maxVal-minVal) + minVal;
end
