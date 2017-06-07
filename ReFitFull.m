function [ coefs ] = ReFitFull( allData, coefsIn, fcName, fc, degPoly )
%FitFull Fit individual, fit polynomial, plot
%   fcName : name of function
%   fc : actual function
%   degPoly : degree of polynomial

% Save out coefficients at each stage
coefs = coefsIn;

dirOut = 'Images/';
nameFc = sprintf('%s_deg%0.0f', fcName, degPoly);

% Fit each material individually
[coefsIndiv, RVals] = FitSingleMaterialAll( allData, fc, coefsIn.Individual );
coefs.Individual = coefsIndiv;
coefs.IndividualRVals = RVals;

figure(1)
PlotDataAndFits( coefsIndiv, fc, allData.lambda, allData.sigma, fcName )
saveGraphics( strcat(dirOut, nameFc, '_Individual.png'),[520,700]);


%% Fit all materials together
%
% First do just as LS fit of polynomial coefficients
figure(2)
[m, coefsPoly] = FitAllPolynomial( allData, coefsIndiv, degPoly );

% Save m and the coefficients
coefs.mForLambda = m;
coefs.Poly = coefsPoly;

% Convert back to coefficients for each material
coefsCheckAllFitPoly = EvalPoly( coefsPoly, m );
% Get RVals
coefs.PolyRVal = CalculateRVals( allData, coefsCheckAllFitPoly , fc);
% and plot
PlotDataAndFits( coefsCheckAllFitPoly, fc, allData.lambda, allData.sigma, fcName )
saveGraphics( strcat(dirOut, nameFc, '_Poly.png'),[520,700]);

% Reconstruct polynomial and plot
figure(3)
% Optimize - use last optimized values
coefsPolyFitted = FitAllMaterials( allData, m, coefsIn.PolyFitted, fc );
% save
coefs.PolyFitted = coefsPolyFitted;

% Reconstruct
coefsCheckAllFit = EvalPoly( coefsPolyFitted, m );
% Get RVals
coefs.FinalRVal = CalculateRVals( allData, coefsCheckAllFit , fc);
PlotDataAndFits( coefsCheckAllFit, fc, allData.lambda, allData.sigma, fcName )
saveGraphics( strcat(dirOut, nameFc, '_PolyFitted.png'),[520,700]);

end

