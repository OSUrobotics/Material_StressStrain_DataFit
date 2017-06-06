function [ sigma ] = polyFc( coefs, lambda )
%ogdenFc Ogden with coefs - takes in coefs and lambda and gives back sigma
%   Detailed explanation goes here

sigma=polyval( coefs, lambda);

end

