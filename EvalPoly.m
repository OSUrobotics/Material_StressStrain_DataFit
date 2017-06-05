function [ coefsPerMaterial ] = EvalPoly( coefsPoly, m, k )
%EvalPoly Get the coefficients in function form from polynomial
%   if k is not added, do all
%   m is materials

if exist('k', 'var')
    coefsPerMaterial = polyval( coefsPoly(k,:), m(k) );
else
    coefsPerMaterial = zeros( length(m), size(coefsPoly, 1) );
    for k = 1:size(coefsPerMaterial,2)
        coefsPerMaterial(:,k) = polyval( coefsPoly(k,:), m );
    end
end

end

