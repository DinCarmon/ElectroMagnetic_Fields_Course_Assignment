function [p_x]=calc_p_x(density_and_potential, Centers_of_Points, b_height, b_length)
%the function computes p_x
[Nreal,~]=size(Centers_of_Points);
p_x=0;
for i=1:Nreal
    p_x=p_x+(Centers_of_Points(i,1)*cos(Centers_of_Points(i,2)))*density_and_potential(i)*b_height*b_length;
end
end

