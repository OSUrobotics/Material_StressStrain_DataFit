%% Read in the data (if it isn't already)

dir = 'DataFilesAll/';
if ~exist( 'allData', 'var' );
    fname = strcat( dir, 'AllData.mat' );
    if exist( fname, 'file' )
        load( fname )
    else    
        allData = ReadAllData( dir );
        save( fname, 'allData' );
    end
end


% Initial guess for Ogden
C_init = [

   -0.1547    1.0799    0.5594    0.6907    0.2706   -0.2083
   -0.0522    1.3990    0.7544    0.5750    0.5116   -0.1717
   -0.0673    1.5128    0.9650    0.7597    1.1289   -0.1807
   -0.0215    1.2349    2.0100    0.7157    1.8477   -0.3293
   -0.0220    0.4645    3.1410    0.6289    2.6073   -0.3058
   -0.0259    0.6187    5.3627    0.5087    4.0625   -0.2482
   -0.0001    1.7301   11.3944    0.2749    5.0433   -0.1789
    ]; 

%Parameters
nameFc = 'Ogden';
fc = @ogdenFc;
degPoly = 3;

% Fit each material individually
coefsIndiv = FitSingleMaterialAll( allData, fc, C_init );

figure(1)
PlotDataAndFits( coefsIndiv, fc, lambda, sigma )

% Fit all materials together
figure(2)
[m, coefsPoly] = FitAllMaterials( allData, coefsIndiv, degPoly, fc );

% Reconstruct polynomial and plot
figure(3)
coefsCheck = EvalPoly( coefsPoly, m );
PlotDataAndFits( coefsCheck, fc, lambda, sigma )

coefs = struct;
coefs.Individual = coefsIndiv;
coefs.All = coefsPoly;
save( strcat(dir, nameFc, 'coefs.mat'), 'coefs' );




coefsFinal = FitAllMaterials( allData, coefs2, 2, @ogden_objective_A );

% plot stress/strain data with model with C_final coefficients to confirm fit
% plot C_final coefficients/m with A coefficients to confirm fit