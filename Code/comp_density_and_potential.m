function [density_and_potential] = comp_density_and_potential( l,b_height, b_length, ext_potential_and_charge )
%the function computes the density in each square and the potential of the
%cylinder
[N_real, ~]=size(l);
L=zeros(N_real+1,N_real+1);
L(1:N_real,1:N_real)=l;
L(1:N_real,N_real+1)=-1;
L(N_real+1,1:N_real)=b_height*b_length;
L(N_real+1,N_real+1)=0;
ext_potential_and_charge_tag=zeros(N_real+1,1);
ext_potential_and_charge_tag(1:N_real)=-ext_potential_and_charge(1:N_real);
ext_potential_and_charge_tag(N_real+1)=ext_potential_and_charge(N_real+1);
density_and_potential=L\(ext_potential_and_charge_tag);


end

