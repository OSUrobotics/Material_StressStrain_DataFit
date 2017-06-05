function [ m, coefsPoly ] = FitAllMaterials( allData, coefsIndiv, degPoly, fc )
%FitAllMaterials Fit all of the coefficients all at once
%   Start with the given coefficients to get the polynomial

[m, coefsPolyInitial] = FitAllPolynomial( allData, coefsIndiv, degPoly );

% Now optimize
options = optimset('MaxFunEvals',1000,'MaxIter',1000);

fprintf('Fitting all together\n');
objfun = @(c) OptFncAll( c, fc, m, allData.lambda, allData.sigma );
coefsPoly = fminsearch(objfun, coefsPolyInitial, options);

end

