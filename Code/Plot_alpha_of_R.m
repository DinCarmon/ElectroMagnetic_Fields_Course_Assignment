function Plot_alpha_of_R(  )
%the function plot alpha according to R
global eps_zero;
global L_1;
global R;
Num=50;
N=2000;
y=size(Num,2);
x=size(Num,2);
for i=1:Num
    r=R/2+i*(2*R-0.5*R)/Num;
    x(i,1)=r;
    x(i,2)=r;
    [ N_1, N_2 ] = find_dimensions( N,L_1,r );%try different R's and calculate for each one alpha_xx,zz
    [ b_height, b_length ] = comp_dimensions( L_1,N_1,r,N_2 );
    [ Centers_of_Points ] = calc_Centers_of_Points( L_1,N_1,r,N_2 );
    [ l ] = compl( Centers_of_Points, b_height, b_length );
    [ ext_potential_and_charge_1 ] = ext_potential_and_charge_of_1_in_direction_x_field( Centers_of_Points );
    [ density_and_potential_1] = comp_density_and_potential( l,b_height, b_length, ext_potential_and_charge_1 );
    [y(i,1)]=(calc_p_x(density_and_potential_1, Centers_of_Points, b_height, b_length))/eps_zero;
    [ ext_potential_and_charge_2 ] = ext_potential_and_charge_of_1_in_direction_z_field( Centers_of_Points );
    [ density_and_potential_2] = comp_density_and_potential( l,b_height, b_length, ext_potential_and_charge_2 );
    [y(i,2)]=(calc_p_z(density_and_potential_2, Centers_of_Points, b_height, b_length))/eps_zero;
end
plot(x,y );
title('alpha (R)');
xlabel('R/2<R[m]<2R') ;
ylabel('alpha[m^3]') ;
legend('alpha_x_x','alpha_z_z','Location','south');
end