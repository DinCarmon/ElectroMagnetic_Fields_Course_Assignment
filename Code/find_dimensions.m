function [ N_1, N_2 ] = find_dimensions( N,L_1,R )
%the function returns how to divide the length and the height so the
%differentials would be approxiamtly squares and approxiamtly 1/N part of
%the surface
N_1=0;%division of L_1- height
N_2=0;%division of the circle- length
min_difference=L_1;%min of difference between the length and height of each differential square
for i=1:N
    for j=1:N
        if abs(i*j-N)<=N/100 %approximatly N elements
            [b_height,b_length]=comp_dimensions( L_1,i,R,j );
            if abs(b_height-b_length)<min_difference %the best division so far
                min_difference=abs(b_height-b_length);
                N_1=i;
                N_2=j;
            end
        end
    end
end
end

