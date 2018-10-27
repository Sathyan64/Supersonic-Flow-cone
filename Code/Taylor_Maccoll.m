function [ddv] = Taylor_Maccoll(theta,v,gamma)
% Derivatives of vr and vtheta, isolated from original Taylor_Maccoll eqn
ddv = zeros(2,1);
ddv(1) = v(2);
ddv(2) = (v(2)^2*v(1)-(gamma-1)/2*(1-v(1)^2-v(2)^2)*(2*v(1)+v(2)*cot(theta)))/((gamma-1)/2*(1-v(1)^2-v(2)^2)-v(2)^2);