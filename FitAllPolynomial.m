function [ m, coefsPoly ] = FitAllPolynomial( allData, coefsIndiv, degPoly )
%FitAllPolynomial Fit the polynomial to the coefsIndiv
%   Do a standard LS fit of the coefficients to a degPoly polynomial

m = linspace(-0.5,0.5,length( allData.lambda ) );

% Make the matrix to solve for
Mmat = ones( length(m), degPoly+1 );
for k = 1:degPoly
    Mmat( :,k ) = (m.^(degPoly-k+1))';
end
%Mmat = [ m.^2; m; ones(1,length(m))]';

coefsPoly = Mmat \ coefsIndiv;

% Each row is the coefficients for that polynomial
%   -p1- for coef 1
%   -pn= for coef n
coefsPoly = coefsPoly';

end

