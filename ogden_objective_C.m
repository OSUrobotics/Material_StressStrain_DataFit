function sse = ogden_objective_C(c, lambda, sigma)

sigmaFc = ogdenFc( c, lambda );
sse = sum( (sigma - sigmaFc).^2 );


%sse = 0;
% for j = 1:length(lambda)
%     strain = lambda(j);
%     stress = 0;
%     for i = 1:3
%         term = strain^c(2*i) - (2^(c(2*i)-1))*(strain^(-0.5*c(2*i)));
%         %c_one*(x.^(c_two)-2^(-1+c_two)*x.^(-c_two/2))+c_three*(x.^(c_four)-2^(-1+c_four)*x.^(-c_four/2))+c_five*(x.^(c_six)-2^(-1+c_six)*x.^(-c_six/2));
%         %term = 
%         stress = stress + (term * c(i));
%     end
%     sse = sse + (sigma(j) - stress)^2;
% end
% %figure(7)
% plot(lambda, stress) 
end 