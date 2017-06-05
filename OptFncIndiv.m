function [ sse ] = OptFncIndiv( c, fc, lambda, sigma )
%OptFncIndiv Calculate the rms error of the fitted function (one material)
%   c - coefficients to the function that will vary
%   fc - the actual funtion (takes c and a lambda)
%   lambda/sigma (stress-strain) input/output to the function (one
%   material)

sigmaFc = fc( c, lambda );
sse = sum( (sigma - sigmaFc).^2 );

end

