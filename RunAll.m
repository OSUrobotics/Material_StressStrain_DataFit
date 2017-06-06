%% Read in the data (if it isn't already)

dir = 'DataFilesAll/';
dirOut = 'Images/';
if ~exist( 'allData', 'var' );
    fname = strcat( dir, 'AllData.mat' );
    if exist( fname, 'file' )
        load( fname )
    else    
        allData = ReadAllData( dir );
        save( fname, 'allData' );
    end
end



%Parameters
names = {'Ogden', 'Martin', 'PolyCubic', 'PolyQuartic', 'PolyQuintic'};
nCoefs = [6, 4, 4, 5, 6];
degsPoly = [2 3 4];
fcs = {@ogdenFc, @martinsFc, @polyFc, @polyFc, @polyFc};

for f = 1:length(names)
    name = names{f};
    fc = fcs{f};
    for degPoly = degsPoly
        fname = sprintf('%scoefs_%s_%d.mat', dir, name, degPoly);
        CInit = ones( length( allData.sigma ), nCoefs(f) );
        if exist( fname, 'file' );
            load( fname );
            CInit = coefs.Individual;

            coefs = ReFitFull( allData, coefs, name, fc, degPoly );
        else
            coefs = FitFull( allData, CInit, name, fc, degPoly );
        end
        save( fname, 'coefs' );
    end
end

% name = 'Poly';
% CInitPoly = ones( length( allData.sigma ), 4 );
% coefsPoly3 = FitFull( allData, C_init, 'Poly', @polyFc, 3 );
% save( strcat(dir, 'coefsPoly3.mat'), 'coefsPoly3' );

