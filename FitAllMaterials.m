function [ coefsPoly ] = FitAllMaterials( allData, m, coefsPolyInitial, fc )
%FitAllMaterials Fit all of the coefficients all at once
%   Start with the given coefficients to get the polynomial

% Now optimize
options = optimset('MaxFunEvals',1000,'MaxIter',1000);

fprintf('Fitting all together\n');
objfun = @(c) OptFncAll( c, fc, m, allData.lambda, allData.sigma );
coefsPoly = fminsearch(objfun, coefsPolyInitial, options);

end

