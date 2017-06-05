function [ coefs ] = FitSingleMaterial( lambda, sigma, coefsInit, fc )
%FitSingleMaterial Fit the coefficients for a single material
%   sigma/lambda : stress/strain
%   coefsInit : First guess for coefficients
%   fc to fit

objfun = @(c)OptFncIndiv(c, fc, lambda, sigma);

coefs = fminsearch(objfun, coefsInit);

% Calculate R squared value for individual fits 
y_test = OptFncIndiv( coefs, fc, lambda, sigma );
Rsq1 = calculatersquare( sigma, y_test );

fprintf(' R squared is %0.3f\n', Rsq1);

end

