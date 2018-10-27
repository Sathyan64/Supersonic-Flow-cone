function [value,isterminal,direction]=outputflag(theta,v,gamma)
value = [1,1]';
isterminal = [0,0]'; %matlab control function 
direction = [0,0]'; %matlab control function

%Vr should never go below zero, so stop the ODE solver when it is eq to 0
if(v(1)<0.0)
    value(1) = 0.0;
    isterminal(1) = 1;
    direction(1) = 0.0;
end 

%Vtheta should never go above zero, so stop the ODE solver 
if(v(2)>0.0)
    value(2) = 0.0;
    isterminal(2) = 1;
    direction(2) = 0.0;
end   
