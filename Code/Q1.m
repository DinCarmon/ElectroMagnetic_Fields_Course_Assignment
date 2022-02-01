global eps_zero;
eps_zero=8.8541878176*10^-12;
ID=[2 0 9 3 2 5 0 2 6];
%my ID
global R
R=((ID(4)+1)/3)*(10^-5);
%according to the eqations given
global L_1
L_1=((ID(6)+ID(7)+3)/(ID(8)+5))*R;
%according to the eqations given

%q1

%1.
N=3000;
%number of elements
[ N_1, N_2 ] = find_dimensions( N,L_1,R );
[ b_height, b_length ] = comp_dimensions( L_1,N_1,R,N_2 );
[ Centers_of_Points ] = calc_Centers_of_Points( L_1,N_1,R,N_2 );

%2.1
[ l ] = compl( Centers_of_Points, b_height, b_length );
%relations between elements matrix
[ ext_potential_and_charge_1 ] = ext_potential_and_charge_of_1_in_direction_x_field( Centers_of_Points );
[ density_and_potential_1] = comp_density_and_potential( l,b_height, b_length, ext_potential_and_charge_1 );

%2.2
comp_phi_const([0,pi/2,pi],density_and_potential_1, Centers_of_Points, N_1,N_2);
comp_z_const([-L_1/4,0,L_1/4],density_and_potential_1, Centers_of_Points, N_1,N_2,L_1);

%2.3
[p_x1]=calc_p_x(density_and_potential_1, Centers_of_Points, b_height, b_length);
alpha_xz=p_x1/(eps_zero);

%3
[ ext_potential_and_charge_2 ] = ext_potential_and_charge_of_1_in_direction_z_field( Centers_of_Points );
[ density_and_potential_2] = comp_density_and_potential( l,b_height, b_length, ext_potential_and_charge_2 );
comp_phi_const([0,pi/2,pi],density_and_potential_2, Centers_of_Points, N_1,N_2);
comp_z_const([-L_1/4,0,L_1/4],density_and_potential_2, Centers_of_Points, N_1,N_2,L_1);
[p_z]=calc_p_z(density_and_potential_2, Centers_of_Points, b_height, b_length);
alpha_zz=p_z/(eps_zero);
[p_x2]=calc_p_x(density_and_potential_2, Centers_of_Points, b_height, b_length);
alpha_xz=p_x2/(eps_zero);

%4
Plot_alpha_of_L();

%5
Plot_alpha_of_R();