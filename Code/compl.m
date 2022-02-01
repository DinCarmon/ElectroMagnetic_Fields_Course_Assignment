function [ l ] = compl( Centers_of_Points, b_height, b_length )
%the function computes the matrix l which symbols the relations between a
%density in a point and its inluences in another point
global eps_zero;
[N_real, ~]=size(Centers_of_Points);
l=zeros(N_real,N_real);
b_avg=(b_height^2+b_length^2)^0.5;
for i=1:N_real
    for j=i:N_real
        %according to the equations learned in class
        if i==j
            l(i,i)=(1/(4*pi*eps_zero))*((b_height*log((b_avg+b_length)/(b_avg-b_length)))+(b_length*log((b_avg+b_height)/(b_avg-b_height))));
        end
        if i~=j
            distancex=(Centers_of_Points(i,1)*cos(Centers_of_Points(i,2))-Centers_of_Points(j,1)*cos(Centers_of_Points(j,2)));
            distancey=(Centers_of_Points(i,1)*sin(Centers_of_Points(i,2))-Centers_of_Points(j,1)*sin(Centers_of_Points(j,2)));
            distancez=Centers_of_Points(i,3)-Centers_of_Points(j,3);
            distance=((distancex)^2+(distancey)^2+(distancez)^2)^0.5;
            l(i,j)=(1/(4*pi*eps_zero))*(b_height*b_length)/(distance);
            l(j,i)=l(i,j);
        end
    end
end
end

