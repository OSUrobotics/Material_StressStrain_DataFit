function [ sse ] = OptFncAll( c, fc, mForLambda, lambda, sigma )
%OptFncAll Calculate the rms error of the fitted function (all)
%   c - coefficients to the function that will vary
%   fc - the actual funtion (takes c and a lambda)
%   lambda/sigma (stress-strain) input/output to the function (all)

sse = 0;
coefs = EvalPoly( c, mForLambda );

for j = 1:length(mForLambda)
    sigmaFc = fc( coefs(j,:), lambda{j});
    sse = sse + sum( (sigmaFc - sigma{j}).^2 );
end

end

