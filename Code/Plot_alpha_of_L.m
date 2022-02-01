function Plot_alpha_of_L(  )
%the function plot alpha according to L
global eps_zero;
global L_1;
global R;
Num=50;
N=2000;
y=size(Num,2);
x=size(Num,2);
for i=1:Num
    L=L_1/2+i*(2*L_1-0.5*L_1)/Num;%try different L's and calculate for each one alpha_xx,zz
    x(i,1)=L;
    x(i,2)=L;
    [ N_1, N_2 ] = find_dimensions( N,L,R );
    [ b_height, b_length ] = comp_dimensions( L,N_1,R,N_2 );
    [ Centers_of_Points ] = calc_Centers_of_Points( L,N_1,R,N_2 );
    [ l ] = compl( Centers_of_Points, b_height, b_length );
    [ ext_potential_and_charge_1 ] = ext_potential_and_charge_of_1_in_direction_x_field( Centers_of_Points );
    [ density_and_potential_1] = comp_density_and_potential( l,b_height, b_length, ext_potential_and_charge_1 );
    [y(i,1)]=(calc_p_x(density_and_potential_1, Centers_of_Points, b_height, b_length))/eps_zero;
    [ ext_potential_and_charge_2 ] = ext_potential_and_charge_of_1_in_direction_z_field( Centers_of_Points );
    [ density_and_potential_2] = comp_density_and_potential( l,b_height, b_length, ext_potential_and_charge_2 );
    [y(i,2)]=(calc_p_z(density_and_potential_2, Centers_of_Points, b_height, b_length))/eps_zero;
end
plot(x,y );
title('alpha(L)');
xlabel('(L_1)/2<L[m]<2L_1') ;
ylabel('alpha[m^3]') ;
legend('alpha_x_x','alpha_z_z','Location','south');
figure
end

