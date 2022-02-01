function [ b_height, b_length ] = comp_dimensions( L_1,N_1,R,N_2 )
%the function returns the length and height of a differential square
b_height=L_1/N_1;
b_length=2*R*(pi/(N_2));
end

