function [ final_strain, final_stress ] = find_max( strain, stress )
%finds the max and crops the material at that point 
%   Detailed explanation goes here

[value, location] = max(stress);
final_stress = stress(1:location,1);

final_strain = strain(1:location,1);
end

