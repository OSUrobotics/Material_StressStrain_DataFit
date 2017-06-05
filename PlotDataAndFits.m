function [  ] = PlotDataAndFits( coefs, fc, lambda, sigma )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

clf

names = {'TP', 'FLX9740', 'FLX9750', 'FLX9760', 'FLX9770', 'FLX9785', 'FLX9795'};

nRows = 2;
nCols = 4;
pIndex = 1;
m = linspace(0,1,length(lambda));
for k = 1:length(lambda)
    subplot(nRows,nCols, pIndex);
    plot( lambda{k}, sigma{k}, '.k'); %plot material
    hold on;
    fplot( @(l) fc(coefs(k,:), l), [min(lambda{k}), max(lambda{k})], '-g' ); %plot invidiual fit
    pIndex = pIndex+1;
    
    xlabel('Strain');
    ylabel('Stress');
    
    title( strcat( names{k}, 'Individual' ) );
    legend('Data', 'Fit');
end

lineStyle = {'-k', '--k', '-b', '--b', '-g', '--g' };
subplot( nRows, nCols, 8 )
for k = 1:size(coefs,2)
    plot( coefs(:,k), lineStyle{k} );
    hold on
end
title('Coeficients');

end