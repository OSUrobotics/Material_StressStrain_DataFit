function [ coefs, RVals ] = FitSingleMaterialAll( allData, fc, initCoefs )
%FitSingleMaterialAll Set each material's coefficients
%   Use the previous coefficients in the next iteration's

coefs = initCoefs;
RVals = zeros( length(allData.lambda), 1 );
for k = 1:length(allData.lambda) % loop over materials
    fprintf('Fitting material %0.0f:\n', k);
    
    [coefs(k,:) RVals(k,1)] = FitSingleMaterial( allData.lambda{k}, allData.sigma{k}, coefs(k, :), fc );
    if k < length(allData.lambda)
        coefs(k+1, :) = coefs(k,:);
    end
end

end

