function [ n ] = calcNbyLevich( K,r,A,C,D,nu )
%getnByLevich ����Koutecky-Levich����б�ʼ���ת�Ƶ�����
%   [ n ] = calcNbyLevich( K,r,A,C,D,nu )
%   K: i^-1 = K*w^(-0.5) + B �е�б��
%   r: ����ϵ��,��ת��Ϊrad/sʱ��0.61,rpmʱ��0.201
%   A: �缫���
%   C: Ũ��
%   D: ��ɢϵ��  
%   nu: �����

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

