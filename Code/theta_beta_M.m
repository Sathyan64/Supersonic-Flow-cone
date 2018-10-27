function retval = theta_beta_M(label1, input1, label2, input2, gamma, delta)
retval = -1;

% Expand the shortest vector to be the same length as the longest vector.
% Hold the last value of the shorter vector.
if length(input1) < length(input2)
    newin1 = zeros(size(input2));
    newin1(1:length(input1)) = input1;
    newin1(length(input1):length(newin1)) = ones(size(input2))*input1(length(input1));
    input1 = newin1;
elseif length(input1) > length(input2)
    newin2 = zeros(size(input1));
    newin2(1:length(input2)) = input2;
    newin2(length(input2):length(newin2)) = ones(size(input1))*input2(length(input2));
    input2 = newin2;
end

if length(input1) ~= length(input2)
    error('Inputs must be of the same length');
else
    
   if strcmpi(label2, 'mach') && strcmpi(label1, 'theta')
        M = input2;
        theta = input1;
        T0_T = 1+(((gamma-1)/2)*M.^2);
        lambda = ((M.^2 -1).^2 -(3.*T0_T.*(1+(((gamma+1)/2)*M.^2)).*tan(theta).^2)).^0.5;
        chi = (((M.^2 -1).^3 - (9.*T0_T.* (T0_T + ((gamma+1)/4).*M.^4).*tan(theta).^2))./ lambda.^3);
        retval = atan((M.^2-1+2.*lambda*cos((4.*pi.*delta + acos(chi))./3))./(3.*T0_T.*tan(theta)));
                   
   elseif strcmpi(label1, 'mach') && strcmpi(label2, 'theta')
        M = input1;
        theta = input2;
        T0_T = 1+(((gamma-1)/2)*M.^2);
        lambda = ((M.^2 -1).^2 -(3.*T0_T.*(1+(((gamma+1)/2)*M.^2)).*tan(theta).^2)).^0.5;
        chi = (((M.^2 -1).^3 - (9.*T0_T.* (T0_T + ((gamma+1)/4).*M.^4).*tan(theta).^2))./ lambda.^3);
        retval = atan((M.^2-1+2.*lambda.*cos((4.*pi.*delta + acos(chi))./3))./(3.*T0_T.*tan(theta)));
        
   elseif strcmpi(label1, 'mach') && strcmpi(label2, 'beta')
        M = input1;
        beta = input2;
        retval=atan(2.*cot(beta).*((M.*sin(beta)).^2-1)./(M.^2*(gamma+cos(2.*beta))+2));   
   end
   
end  