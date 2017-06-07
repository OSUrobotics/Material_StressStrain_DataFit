function  [ sigma ] = yeohsFc( coefs, lambda )
%UNTITLED14 Yeoh's function from paper
%   Detailed explanation goes here

I1 = lambda;
sigma = 2 * (lambda.^2 - 1 ./ lambda) .* ...
   ( coefs(1) + 2 .* coefs(2) .* (I1-3) + 3 .* coefs(3) .* (I1 - 3).^2 );
end

