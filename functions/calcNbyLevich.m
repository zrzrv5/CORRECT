function [ n ] = calcNbyLevich( K,r,A,C,D,nu )
%getnByLevich 利用Koutecky-Levich方程斜率计算转移电子数
%   [ n ] = calcNbyLevich( K,r,A,C,D,nu )
%   K: i^-1 = K*w^(-0.5) + B 中的斜率
%   r: 比例系数,当转速为rad/s时用0.61,rpm时用0.201
%   A: 电极面积
%   C: 浓度
%   D: 扩散系数  
%   nu: 黏滞率

% 

% if nargin == 1
%         r = 0.201;
%         A = (0.25^2)*pi;
%         C = 1.2*10^(-6);
%         D = 1.9*10^(-5);
%         nu = 0.01;
% end



n = 1 ./ (r*K*96500*A*C*D^(2/3)*nu^(-1/6));

end

