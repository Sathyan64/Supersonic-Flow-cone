function[delta_cone,M_cone] = inviscidcone(M1,beta,gamma)
beta = beta*pi/180; %converting to radians
delta = theta_beta_M ('mach', M1, 'beta', beta, gamma, 1.0);
Mach_angle = asin(1/M1);

if(beta<=Mach_angle) % if less than wave angle delta cone = 0 and M_cone  = M1
    delta_cone = 0.0;
    M_cone = M1;
    return;
end
M1n = M1*sin(beta);
M2n = sqrt((M1n^2+(2/(gamma-1)))/(2*gamma/(gamma-1)*M1n^2-1));
M2 = M2n/sin(beta-delta);
v = ((2/((gamma-1)*M2^2))+1)^(-1/2);
v_r_in = v*cos(beta-delta);
v_theta_in = -v* sin(beta - delta);
v_in = [v_r_in;v_theta_in]; % Initial guess for the solver
theta_range = [beta,1e-10]; % Range of theta from max to min

%calls outputflag function, where it says when to stop the Ode solver
options = odeset('Events',@outputflag,'RelTol', 1e-8); 
%calls the Taylor Maccoll function and solves the ODE until required 
%conditions are met
[v_vec] = ode113(@Taylor_Maccoll,theta_range,v_in,options,gamma); 

%Making sure v_theta is less than 1E-8, so we can get more accurate 
%value for deflection angle
if(abs(v_vec.ye(2) < 1e-8))
    delta_cone=v_vec.xe*180.0/pi;
    v_cone = v_vec.ye(1)^2+v_vec.ye(2)^2;
    %M relation from Anderson "Modern Compressible Flow"
    M_cone=((1.0/v_cone-1)*(gamma-1)/2)^(-1/2); 
end
