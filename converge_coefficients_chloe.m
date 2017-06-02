% replace this matrix with new coefficients from data fitting
% C_init = [ 
%     -0.1327    0.8725    0.5497    0.6785   0.2823     -0.3275   % Tango, all c
%     -0.06261    0.8839   0.7918    0.7286   0.6466    -0.3443 % FLX 9740
%     1.059      -0.3247   -0.06798  0.9495  1.254    0.7034 %FLX 9750 
%     0.7875    0.6733     1.641    -0.327   1.115    0.6733 % FLX 9760
%     -0.02881    1.034   3.107     0.6359    2.623   -0.3012     %FLX 9770
%     3.553      -0.2763   3.69   0.3579    2.001    0.6616   %FLX9785
%     6.042    0.2459    6.455    0.2459   4.307   -0.1926 % FLX 9795     
% ];

C_init = [

   -0.1547    1.0799    0.5594    0.6907    0.2706   -0.2083
   -0.0522    1.3990    0.7544    0.5750    0.5116   -0.1717
   -0.0673    1.5128    0.9650    0.7597    1.1289   -0.1807
   -0.0215    1.2349    2.0100    0.7157    1.8477   -0.3293
   -0.0220    0.4645    3.1410    0.6289    2.6073   -0.3058
   -0.0259    0.6187    5.3627    0.5087    4.0625   -0.2482
   -0.0001    1.7301   11.3944    0.2749    5.0433   -0.1789
    ]; 

C_final = zeros(7, 6);
% %%%TP%%%
dir = 'DataFilesAll/';
TP_1 = dlmread(strcat(dir,'1_Sample1_StressAndStrain.txt'));
StressTP_1 = TP_1(:,1);
StrainTP_1 = TP_1(:,2);

TP_2 = dlmread(strcat(dir,'1_Sample2_StressAndStrain.txt'));
StressTP_2 = TP_2(:,1);
StrainTP_2 = TP_2(:,2);

TP_3 = dlmread(strcat(dir,'1_Sample3_StressAndStrain.txt'));
StressTP_3 = TP_1(:,1);
StrainTP_3 = TP_1(:,2);


%%%FLX9740%%%
FLX9740_1 = dlmread(strcat(dir,'2_Sample1_StressAndStrain.txt'));
StressFLX9740_1 = FLX9740_1(:,1);
StrainFLX9740_1 = FLX9740_1(:,2);

FLX9740_2 = dlmread(strcat(dir,'2_Sample2_StressAndStrain.txt'));
StressFLX9740_2 = FLX9740_2(:,1);
StrainFLX9740_2 = FLX9740_2(:,2);

FLX9740_3 = dlmread(strcat(dir,'2_Sample3_StressAndStrain.txt'));
StressFLX9740_3 = FLX9740_3(:,1);
StrainFLX9740_3 = FLX9740_3(:,2);


%%%FLX9750%%%%
FLX9750_1 = dlmread(strcat(dir,'3_Sample1_StressAndStrain.txt'));
StressFLX9750_1 = FLX9750_1(:,1);
StrainFLX9750_1 = FLX9750_1(:,2);

FLX9750_2 = dlmread(strcat(dir,'3_Sample2_StressAndStrain.txt'));
StressFLX9750_2 = FLX9750_2(:,1);
StrainFLX9750_2 = FLX9750_2(:,2);

FLX9750_3 = dlmread(strcat(dir,'3_Sample3_StressAndStrain.txt'));
StressFLX9750_3 = FLX9750_3(:,1);
StrainFLX9750_3 = FLX9750_3(:,2);


%%%FLX9760%%%
FLX9760_1 = dlmread(strcat(dir,'4_Sample1_StressAndStrain.txt'));
StressFLX9760_1 = FLX9760_1(:,1);
StrainFLX9760_1 = FLX9760_1(:,2);

FLX9760_2 = dlmread(strcat(dir,'4_Sample2_StressAndStrain.txt'));
StressFLX9760_2 = FLX9760_2(:,1);
StrainFLX9760_2 = FLX9760_2(:,2);

FLX9760_3 = dlmread(strcat(dir,'4_Sample3_StressAndStrain.txt'));
StressFLX9760_3 = FLX9760_3(:,1);
StrainFLX9760_3 = FLX9760_3(:,2);

%%%FLX9770%%%
FLX9770_1 = dlmread(strcat(dir,'5_Sample1_StressAndStrain.txt'));
StressFLX9770_1 = FLX9770_1(:,1);
StrainFLX9770_1 = FLX9770_1(:,2);

FLX9770_2 = dlmread(strcat(dir,'5_Sample2_StressAndStrain.txt'));
StressFLX9770_2 = FLX9770_2(:,1);
StrainFLX9770_2 = FLX9770_2(:,2);

FLX9770_3 = dlmread(strcat(dir,'5_Sample3_StressAndStrain.txt'));
StressFLX9770_3 = FLX9770_3(:,1);
StrainFLX9770_3 = FLX9770_3(:,2);

%%%FLX9785%%%
FLX9785_1 = dlmread(strcat(dir,'6_Sample1_StressAndStrain.txt'));
StressFLX9785_1 = FLX9785_1(:,1);
StrainFLX9785_1 = FLX9785_1(:,2);

FLX9785_2 = dlmread(strcat(dir,'6_Sample2_StressAndStrain.txt'));
StressFLX9785_2 = FLX9785_2(:,1);
StrainFLX9785_2 = FLX9785_2(:,2);

FLX9785_3 = dlmread(strcat(dir,'6_Sample3_StressAndStrain.txt'));
StressFLX9785_3 = FLX9785_3(:,1);
StrainFLX9785_3 = FLX9785_3(:,2);
%%%FLX9795%%% 
FLX9795_1 = dlmread(strcat(dir,'7_Sample1_StressAndStrain.txt'));
StressFLX9795_1 = FLX9795_1(:,1);
StrainFLX9795_1 = FLX9795_1(:,2);

FLX9795_2 = dlmread(strcat(dir,'7_Sample2_StressAndStrain.txt'));
StressFLX9795_2 = FLX9795_2(:,1);
StrainFLX9795_2 = FLX9795_2(:,2);

FLX9795_3 = dlmread(strcat(dir,'7_Sample3_StressAndStrain.txt'));
StressFLX9795_3 = FLX9795_3(:,1);
StrainFLX9795_3 = FLX9795_3(:,2);

% names = cell(TP, FLX9740, FLX9750, FLX9760, FLX9770, FLX9785, FLX9795);
% 
% 
%  for l = 1:3
%     filename = strcat(num2str(s), '_Sample', num2str(l), '_StressAndStrain.txt');
%     [ final_stress, final_strain ] = read_data( dir, filename );
%  end 
  
[ StrainTP_1, StressTP_1 ] = find_max( StrainTP_1, StressTP_1 );
[ StrainTP_2, StressTP_2 ] = find_max( StrainTP_2, StressTP_2 );
[ StrainTP_3, StressTP_3 ] = find_max( StrainTP_3, StressTP_3 );



[ StrainFLX9740_1, StressFLX9740_1 ] = find_max( StrainFLX9740_1, StressFLX9740_1 );
[ StrainFLX9740_2, StressFLX9740_2 ] = find_max( StrainFLX9740_2, StressFLX9740_2 );
[ StrainFLX9740_3, StressFLX9740_3 ] = find_max( StrainFLX9740_3, StressFLX9740_3 );

[ StrainFLX9750_1, StressFLX9750_1 ] = find_max( StrainFLX9750_1, StressFLX9750_1 );
[ StrainFLX9750_2, StressFLX9750_2 ] = find_max( StrainFLX9750_2, StressFLX9750_2 );
[ StrainFLX9750_3, StressFLX9750_3 ] = find_max( StrainFLX9750_3, StressFLX9750_3 );

[ StrainFLX9760_1, StressFLX9760_1 ] = find_max( StrainFLX9760_1, StressFLX9760_1 );
[ StrainFLX9760_2, StressFLX9760_2 ] = find_max( StrainFLX9760_2, StressFLX9760_2 );
[ StrainFLX9760_3, StressFLX9760_3 ] = find_max( StrainFLX9760_3, StressFLX9760_3 );

[ StrainFLX9770_1, StressFLX9770_1 ] = find_max( StrainFLX9770_1, StressFLX9770_1 );
[ StrainFLX9770_2, StressFLX9770_2 ] = find_max( StrainFLX9770_2, StressFLX9770_2 );
[ StrainFLX9770_3, StressFLX9770_3 ] = find_max( StrainFLX9770_3, StressFLX9770_3 );

[ StrainFLX9785_1, StressFLX9785_1 ] = find_max( StrainFLX9785_1, StressFLX9785_1 );
[ StrainFLX9785_2, StressFLX9785_2 ] = find_max( StrainFLX9785_2, StressFLX9785_2 );
[ StrainFLX9785_3, StressFLX9785_3 ] = find_max( StrainFLX9785_3, StressFLX9785_3 );

[ StrainFLX9795_1, StressFLX9795_1 ] = find_max( StrainFLX9795_1, StressFLX9795_1 );
[ StrainFLX9795_2, StressFLX9795_2 ] = find_max( StrainFLX9795_2, StressFLX9795_2 );
[ StrainFLX9795_3, StressFLX9795_3 ] = find_max( StrainFLX9795_3, StressFLX9795_3 );





%%CREATE THE LAMBDA AND SIGMA 

lambda{1} = [StrainTP_1(3300:end,1); StrainTP_2(1400:end,1); StrainTP_3(2400:end,1)];
lambda{2} = [StrainFLX9740_1(1000:end,1); StrainFLX9740_2(1400:end,1); StrainFLX9740_3(1400:end,1)];
lambda{3} = [StrainFLX9750_1(680:end,1);  StrainFLX9750_2(1000:end,1);  StrainFLX9750_3(900:end,1)];
lambda{4} = [StrainFLX9760_1(600:end,1); StrainFLX9760_2; StrainFLX9760_3(400:end,1)];
lambda{5} = [StrainFLX9770_1(400:end,1); StrainFLX9770_2(400:end,1); StrainFLX9770_3];
lambda{6} = [StrainFLX9785_1; StrainFLX9785_2; StrainFLX9785_3];
lambda{7} = [StrainFLX9795_1; StrainFLX9795_2; StrainFLX9795_3]; 
    
sigma{1} = [StressTP_1(3300:end,1); StressTP_2(1400:end,1); StressTP_3(2400:end,1)]; 
sigma{2} = [StressFLX9740_1(1000:end,1); StressFLX9740_2(1400:end,1); StressFLX9740_3(1400:end,1)];
sigma{3} = [StressFLX9750_1(680:end,1);  StressFLX9750_2(1000:end,1);  StressFLX9750_3(900:end,1)];
sigma{4} = [StressFLX9760_1(600:end,1); StressFLX9760_2; StressFLX9760_3(400:end,1)];
sigma{5} = [StressFLX9770_1(400:end,1); StressFLX9770_2(400:end,1); StressFLX9770_3];
sigma{6} = [StressFLX9785_1; StressFLX9785_2; StressFLX9785_3];
sigma{7} = [StressFLX9795_1; StressFLX9795_2; StressFLX9795_3];

% lambda{1} = [StrainTP_1(1:end,1); StrainTP_2(1:end,1); StrainTP_3(1:end,1)];
% lambda{2} = [StrainFLX9740_1(1:end,1); StrainFLX9740_2(1:end,1); StrainFLX9740_3(1:end,1)];
% lambda{3} = [StrainFLX9750_1(1:end,1);  StrainFLX9750_2(1:end,1);  StrainFLX9750_3(1:end,1)];
% lambda{4} = [StrainFLX9760_1(1:end,1); StrainFLX9760_2(1:end,1); StrainFLX9760_3(1:end,1)];
% lambda{5} = [StrainFLX9770_1(1:end,1); StrainFLX9770_2(1:end,1); StrainFLX9770_3(1:end,1)];
% lambda{6} = [StrainFLX9785_1(1:end,1); StrainFLX9785_2(1:end,1); StrainFLX9785_3(1:end,1)];
% lambda{7} = [StrainFLX9795_1(1:end,1); StrainFLX9795_2(1:end,1); StrainFLX9795_3(1:end,1)]; 
%     
% sigma{1} = [StressTP_1(1:end,1); StressTP_2(1:end,1); StressTP_3(1:end,1)]; 
% sigma{2} = [StressFLX9740_2(1:end,1); StressFLX9740_2(1:end,1); StressFLX9740_3(1:end,1)];
% sigma{3} = [StressFLX9750_2(1:end,1);  StressFLX9750_2(1:end,1);  StressFLX9750_3(1:end,1)];
% sigma{4} = [StressFLX9760_1(1:end,1); StressFLX9760_2(1:end,1); StressFLX9760_3(1:end,1)];
% sigma{5} = [StressFLX9770_2(1:end,1); StressFLX9770_2(1:end,1); StressFLX9770_3(1:end,1)];
% sigma{6} = [StressFLX9785_2(1:end,1); StressFLX9785_2(1:end,1); StressFLX9785_3(1:end,1)];
% sigma{7} = [StressFLX9795_2(1:end,1); StressFLX9795_2(1:end,1); StressFLX9795_3(1:end,1)];
% OOOPSSSS!!!
% swap = sigma;
% sigma = lambda;
% lambda = swap;


C_finalIndiv = C_init;
for k = 1:length(lambda) % loop over materials
    fprintf('Fitting material %0.0f\n', k);
    
    objfun = @(c)ogden_objective_C(c, lambda{k}, sigma{k});
    if k == 1
        c_init = C_init(k, :); % seems to be highly dependent on initial guess
    else
        c_init = C_finalIndiv(k-1,:);
    end
    C_finalIndiv(k, :) = fminsearch(objfun, c_init);
    %Calculate R squared value for individual fits 
    y_test = ogdenFc( C_finalIndiv(k,:), lambda{k} );
    Rsq1 = calculatersquare( sigma{k}, y_test );
    fprintf('R squared material %0.0f is %3f\n', k, Rsq1);
end

PlotDataAndFits( C_finalIndiv, 3, lambda, sigma )

C_sort = C_finalIndiv;
% posOrders = [ 1 2 3; 1 3 2; 2 1 3; 2 3 1; 3 1 2; 3 2 1];
% disp( C_sort );
% for k = 2:length(lambda)
%     iBestFit = C_sort(k,:);
%     dBestFit = 1e30;
%     
%     for o = 1:size(posOrders,1)
%         pOrders = posOrders(o,:);
%         for c = 1:3
%             i1 = (pOrders(c) - 1) * 2 + 1;
%             C_sort(k, (c-1)*2+1) = C_finalIndiv(k, i1);
%             C_sort(k, (c-1)*2+2) = C_finalIndiv(k, i1+1);
%         end
%         dScore = sum( (C_sort(1,:) - C_sort(k,:)).^2 );
%         if dScore < dBestFit
%             dBestFit = dScore;
%             iBestFit = C_sort(k,:);
%         end
%         C_sort(k,:) = iBestFit;
%     end
% end     
% disp( C_sort);
% PlotDataAndFits( C_sort, 3, lambda, sigma )

%m = 1:7;
m = linspace(0,1,7);
Mmat = [ m.^2; m; ones(1,length(m))]';
C_fit = C_sort;
%C_fit(end,:) = C_fit(end-1,:);
A = Mmat \ C_fit;

disp(Mmat * A);
 
A = A';
%when m is linspace(0,1,7)
%  A = [-0.5121    0.8588   -0.1074
%     0.0917   -0.7974    1.4776
%    14.7025   -5.3859    0.9262
%    -0.6624    0.3608    0.5292
%     2.8945    1.1475    0.1451
%     0.7095   -0.6914   -0.1935
%     ];


%PlotDataAndFits( C_sort, A, lambda, sigma, true )

options = optimset('MaxFunEvals',1000,'MaxIter',1000);

objfun = @(A)ogden_objective_A(A, m, lambda, sigma);
A = fminsearch(objfun, A, options);


for k = 1:length(lambda) % loop over materials
    fprintf('Fitting material %0.0f all together,', k);
    %Calculate R squared value 
    %y_test = ogdenFc( C_sort(k,:), lambda{k} );
    y_test = ogdenFcAll( A, m(k), lambda{k} );
    Rsq1  = calculatersquare( sigma{k}, y_test );
    fprintf('R squared of material %0.0f is %3f\n', k, Rsq1);
end

PlotDataAndFits( C_sort, A, lambda, sigma, true )



% plot stress/strain data with model with C_final coefficients to confirm fit
% plot C_final coefficients/m with A coefficients to confirm fit