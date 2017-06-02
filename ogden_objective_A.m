function sse = ogden_objective_A(coefsPolys, mForLambda, lambda, sigma)

sse = 0;
for j = 1:length(lambda)
    sigmaFc = ogdenFcAll( coefsPolys, mForLambda(j), lambda{j});
    sse = sse + sum( (sigmaFc - sigma{j}).^2 );
end

% function sse = ogden_objective_C(c, lambda, sigma)
% 
% sigmaFc = ogdenFc( c, lambda );
% sse = sum( (sigma - sigmaFc).^2 );

% sse = 0;
% c = get_C_from_A(coefsPolys, m);
% for j = 1:length(lambda)
%     strain = lambda(j);
%     stress = 0;
%     for i = 1:3
%         term = strain^c(2*i) - (2^(c(2*i)-1))*(strain^(-0.5*c(2*i)));
%         stress = stress + (term * c(i));
%     end
%     sse = sse + (sigma(j) - stress)^2;
% end
end
