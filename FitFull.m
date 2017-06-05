function [ coefs ] = FitFull( allData, C_init, fcName, fc, degPoly )
%FitFull Fit individual, fit polynomial, plot
%   fcName : name of function
%   fc : actual function
%   degPoly : degree of polynomial


nameFc = sprintf('%s_deg%0.0f', fcName, degPoly);

% Fit each material individually
coefsIndiv = FitSingleMaterialAll( allData, fc, C_init );

figure(1)
PlotDataAndFits( coefsIndiv, fc, allData.lambda, allData.sigma )
saveGraphics( strcat(dirOut, nameFc, '_Individual.pdf'),[520,700]);


%% Fit all materials together
%
% First do just as LS fit of polynomial coefficients
figure(2)
[m, coefsPoly] = FitAllPolynomial( allData, coefsIndiv, degPoly );
coefsCheckAllFitPoly = EvalPoly( coefsPoly, m );
PlotDataAndFits( coefsCheckAllFitPoly, fc, allData.lambda, allData.sigma )
saveGraphics( strcat(dirOut, nameFc, '_Poly.pdf'),[520,700]);

% Reconstruct polynomial and plot
figure(3)
coefsPolyFitted = FitAllMaterials( allData, m, coefsPoly, fc );
coefsCheckAllFit = EvalPoly( coefsPolyFitted, m );
PlotDataAndFits( coefsCheckAllFit, fc, allData.lambda, allData.sigma )
saveGraphics( strcat(dirOut, nameFc, '_PolyFitted.pdf'),[520,700]);

% Save out coefficients at each stage
coefs = struct;
coefs.Individual = coefsIndiv;
coefs.mForLambda = m;
coefs.Poly = coefsPoly;
coefs.PolyFitted = coefsPolyFitted;
save( strcat(dir, nameFc, 'coefs.mat'), 'coefs' );
end

