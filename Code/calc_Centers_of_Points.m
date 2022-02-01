function [ Centers_of_Points ] = calc_Centers_of_Points( L_1,N_1,R,N_2 )
%the functions returns a list of the centers of points in polar coordinates
Centers_of_Points = zeros((N_1*N_2),3);
for i=1:N_1*N_2
    Centers_of_Points(i,1)=R;%r
    Centers_of_Points(i,2)=mod((pi/N_2)*(2*mod(i,N_2)-1),2*pi);%phi
    Centers_of_Points(i,3)=(L_1/N_1)*(double(idivide(int32(i-1), N_2, 'floor'))+(1/2)*(1-N_1));%z
    %the algorithms for phi and z may be a bit tricky. it took a while to
    %find the best division so it will be simetrical and consistant
end
end

