function [ Rsq1 ] = calculatersquare( y, yCalc )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

Rsq1 = 1 - sum((y - yCalc).^2)/sum((y - mean(y)).^2);

end

