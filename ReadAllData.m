function [ allData ] = ReadAllData( dir )
%ReadAllData Read each data file and build the struct that has it all
%   allData.lambda : the strain values for each material (glommed together
%   samples
%   allData.sigma : the stress values for each material (glommed together
%   samples)
%   allData.names : Name of material

allData = struct;
allData.names = {'TP', 'FLX9740', 'FLX9750', 'FLX9760', 'FLX9770', 'FLX9785', 'FLX9795'};
allData.lambda = cell( length( allData.names ), 1 );
allData.sigma = cell( length( allData.names ), 1 );

% Clip front end
clips = [ 3300, 1400, 2400; ...
          1000, 1400, 1400; ...
          680, 1000, 900; ...
          600, 1, 400; ...
          400, 400, 1; ...
          1, 1, 1; ...
          1, 1, 1 ];
      
for material = 1:length( allData.names )
    for sample = 1:3
        [stress, strain] = ReadDataFile( dir, material, sample, clips( material, sample ) );
        allData.lambda{material,1} = [ allData.lambda{material,1}, strain ];
        allData.sigma{material,1} = [ allData.sigma{material,1}, stress ];
    end
end

end

