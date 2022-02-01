function [ ext_potential_and_charge ] = ext_potential_and_charge_of_1_in_direction_x_field( Centers_of_Points )
%the function computes the external potential in each point of 1_in_direction_x_field
[N_real, ~]=size(Centers_of_Points);
ext_potential_and_charge=zeros(N_real+1,1);
for i=1:N_real
    ext_potential_and_charge(i)=-Centers_of_Points(i,1)*cos(Centers_of_Points(i,2));%psi_ext=rcosphi
end
ext_potential_and_charge(N_real+1)=0;
end

