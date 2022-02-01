function comp_z_const(zeds,density_and_potential, Centers_of_Points, N_1,N_2,L)
%the function plots a graph of the density at z(for each z in zeds) according to phi
[~,size_zeds]=(size(zeds));
y=size(N_2,size_zeds);
x=size(N_2,size_zeds);
for i=1:N_2
    for j=1:size_zeds
        y(i,j)=density_and_potential(i+int32((N_1-1)*N_2*((zeds(j)+L/2)/L)));
        x(i,j)=Centers_of_Points(i+int32((N_1-1)*N_2*((zeds(j)+L/2)/L)),2);
    end
end
plot(x,y);
title('density at z (phi)');
xlabel('0<phi<2*pi') ;
ylabel('density[C/m^2]') ;
legend(strread(num2str(zeds),'%s'),'Location','southwest');
figure
end
