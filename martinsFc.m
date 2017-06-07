function [ sigma ] = martinsFc( coefs, lambda )
%martinsFc Martin's function from paper
%   Detailed explanation goes here

sigma = 2 * (lambda.^2 - 1 ./ lambda ) .* coefs(1) .* coefs(2) .* exp( coefs(1) .* lambda ) ...
     + 2 * lambda .* (lambda-1) .* coefs(3) .* coefs(4) .* exp( coefs(3) .* (lambda - 1 ).^2 );
end

