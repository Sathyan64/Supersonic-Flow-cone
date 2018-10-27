%Project 1 main function
clear;
prompt = 'Incoming Mach number : ';
M = input(prompt); %Incoming Mach number
prompt2 = 'Shock Angle [deg] : ';
Beta = input(prompt2);
mu = asind(1/M); % Mach angle
gamma = 1.4; % ratio of specific heat of gas
 if(Beta<mu) % checking if it is less than wave angle
     fprintf('The shock angle specified is less than the Mach angle\n');
 end    
[deltacone,Mcone] = inviscidcone(M,Beta,1.4); %function build for the project

fprintf('Cone deflection angle is : %.4f\n', deltacone);
fprintf('Mach number at surface of cone is : %.4f\n', Mcone);

% The following lines allows to solve for different betas for the given upstream Mach number      
% Beta = [mu:0.1:70.0];
% gamma = 1.4;
% N = size(Beta);
% for i = 1:N(2)
%   [deltacone(i),Mcone(i)] = inviscidcone(M,Beta(i),gamma);
% end 
% 
% figure(2);
% hold on;
% plot(deltacone,Mcone);

