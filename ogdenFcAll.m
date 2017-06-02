function [ sigma ] = ogdenFcAll( coefsPolys, m, lambda )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

coefs = zeros(1,6);
for k = 1:6
    coefs(k) = polyval( coefsPolys(k,:), m );
end

sigma = ogdenFc( coefs, lambda );
end

