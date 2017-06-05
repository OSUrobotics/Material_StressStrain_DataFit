function [ stress, strain ] = ReadDataFile( dir, materialId, sampleId, clipStart )
%ReadData Read the data in and split it up
%   Map materialId to name

fname = sprintf('%s%0.0f_Sample%0.0f_StressAndStrain.txt', dir, materialId, sampleId );
dataMatrix = dlmread(fname);

stress = dataMatrix(1:end,1)';
strain = dataMatrix(1:end,2)';
[strain, stress] = find_max( strain, stress );

stress = stress(clipStart:end);
strain = strain(clipStart:end);

end

