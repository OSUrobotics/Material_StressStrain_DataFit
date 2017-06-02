dir = 'DataFiles/';

for s = 1:7
    for l = 1:3
    filename = strcat(num2str(s), '_Sample', num2str(l), '_StressAndStrain.txt');
    [ final_stress, final_strain ] = read_data( dir, filename );
    end 
end 