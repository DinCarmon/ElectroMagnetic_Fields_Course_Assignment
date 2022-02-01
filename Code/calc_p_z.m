function [p_z]=calc_p_z(density_and_potential, Centers_of_Points, b_height, b_length)
%the function computes p_x
[Nreal,~]=size(Centers_of_Points);
p_z=0;
for i=1:Nreal
    p_z=p_z+Centers_of_Points(i,3)*density_and_potential(i)*b_height*b_length;
end
end

