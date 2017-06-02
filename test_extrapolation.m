%Test extrapolation 

m = 0.4; 

c_one = -1.1003*m^(2) + 1.2263*m + -0.1408;
  c_two =  -0.0046*m^(2) +   -0.5049*m +   1.4082;
  c_three = 15.3259*m^(2) +   -5.9351*m +    1.0001;
  c_four =  -0.7300*m^(2) +    0.4358*m +    0.5459;
  c_five =  3.6022*m^(2) +    0.8816*m +    0.1686;
  c_six = 0.7538*m^(2) +   -0.6806*m +   -0.2277;
    
x = StrainFLX9750_1;

stress = c_one*(x.^(c_two)-2^(-1+c_two)*x.^(-c_two/2))+c_three*(x.^(c_four)-2^(-1+c_four)*x.^(-c_four/2))+c_five*(x.^(c_six)-2^(-1+c_six)*x.^(-c_six/2));

plot(StrainFLX9750_1, stress); 
%xlim([0 inf])
%xlim([-1 1]);
%ylim([-3 2]);