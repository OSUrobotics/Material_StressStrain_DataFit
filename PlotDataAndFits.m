function [  ] = PlotDataAndFits( coefsInit, coefsFinal, lambda, sigma, bDoFinal )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

clf

if ~exist('bDoFinal', 'var')
    bDoFinal = false;
end

nRows = 2;
nCols = 4;
pIndex = 1;
m = linspace(0,1,length(lambda));
for k = 1:length(lambda)
    subplot(nRows,nCols, pIndex);
    plot( lambda{k}, sigma{k}, '.k'); %plot material
    hold on;
    fplot( @(l) ogdenFc(coefsInit(k,:), l), [min(lambda{k}), max(lambda{k})], '-g' ); %plot invidiual fit
    if bDoFinal
        fplot( @(l) ogdenFcAll(coefsFinal, m(k), l), [min(lambda{k}), max(lambda{k})], '-b' ); %plot overall fit 
    end
    pIndex = pIndex+1;
end

end
