%Graph creator function 
function [ final_stress, final_strain ] = read_data( dir, filename ) 
 


Data = dlmread(strcat(dir,filename));

stress = Data(:,1);
strain = Data(:,2);

[value, location] = max(stress);
final_stress = stress(1:location,1);

final_strain = strain(1:location,1);
% [value, location] = max(strain);
% final_strain = strain(1:location,1);
%Create plots of the data 


% plot(strain, stress,'r')
% hold on 
% plot(final_strain, final_stress,'g')
 
end
