function [ coefs ] = FitSingleMaterialAll( allData, fc, initCoefs )
%FitSingleMaterialAll Set each material's coefficients
%   Use the previous coefficients in the next iteration's

coefs = initCoefs;
for k = 1:length(allData.lambda) % loop over materials
    fprintf('Fitting material %0.0f:\n', k);
    
    coefs(k,:) = FitSingleMaterial( allData.lambda{k}, allData.sigma{k}, coefs(k, :), fc );
    if k < length(allData.lambda)
        coefs(k+1, :) = coefs(k,:);
    end
end

end

