function [ RVals ] = CalculateRVals( allData, coefs, fc )
%CalculateRVals Calculate RVals for each individual material
%   Reconstructs polys

RVals = zeros( length(allData.sigma), 1 );
for k = 1:length(allData.sigma)
    % Calculate R squared value for individual fits 
    sigmaFc = fc( coefs(k,:), allData.lambda{k} );
    RVals(k) = calculatersquare( allData.sigma{k}, sigmaFc );

    fprintf('  Material %0.0f, RVal %0.6f\n', k, RVals(k) );
end
end

