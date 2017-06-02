function [ sigma ] = ogdenFc( coefs, lambda )
%ogdenFc Ogden with coefs - takes in coefs and lambda and gives back sigma
%   Detailed explanation goes here

term1 = lambda.^coefs(2) - (2.^(coefs(2)-1))*(lambda.^(-0.5*coefs(2)));
term2 = lambda.^coefs(4) - (2.^(coefs(4)-1))*(lambda.^(-0.5*coefs(4)));
term3 = lambda.^coefs(6) - (2.^(coefs(6)-1))*(lambda.^(-0.5*coefs(6)));

sigma = coefs(1) .* term1 + coefs(3) .* term2 + coefs(5) .* term3;

end

