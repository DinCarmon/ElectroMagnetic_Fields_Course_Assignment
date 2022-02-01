function comp_phi_const(phis,density_and_potential, Centers_of_Points, N_1,N_2)
%the function plots a graph of the density at phi(each one in phis) according to z
[~,size_phis]=(size(phis));
y=size(N_1,size_phis);
x=size(N_1,size_phis);
for i=1:N_1
    for j=1:size_phis
        y(i,j)=density_and_potential(1+int32(N_2*phis(j)/(2*pi))+(i-1)*N_2);
        x(i,j)=Centers_of_Points(1+int32(N_2*phis(j)/(2*pi))+(i-1)*N_2,3);
    end
end
plot(x,y);
title('density at phi (z)');
xlabel('-L1/2<z[m]<L1/2') ;
ylabel('density[C/m^2]') ;
legend(strread(num2str(phis),'%s'),'Location','south');
figure
end

