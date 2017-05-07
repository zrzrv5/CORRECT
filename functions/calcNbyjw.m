function [ ns ] = calcNbyjw(jMat,vArray,wArray,KLargs,verbose)
%getNbyjw ���ݵ����ܶ���w��ϵ����n
%   jMat : ��������,ÿһ����ͬһw�²�ͬ��ѹ�µĵ���
%   vArray : ��ѹ����,
%   wArray : w����
%   KLargs : K-L���̲�������[r,A,C,D,nu],����μ�calcNbyjw.
%   ns : ���n����

    %initial set up
    
    narginchk(4,5);
    if nargin == 4
        verbose = false;
    end
    
    
    if ~isequal(size(KLargs),[1,5]) 
        error('Error : Arguments not suit for K-L equations.\neg. [r,A,C,D,nu] please visit calcNbyLevich for more details.');
    end
    KLargs_r = KLargs(1); 
    KLargs_a = KLargs(2);
    KLargs_c = KLargs(3);
    KLargs_d = KLargs(4);
    KLargs_n = KLargs(5);
    
    ns = [];
    W = wArray.^(-1/2);
    W = W';
    
    J = 1./jMat;
    
    if verbose 
       disp('--------------\nArgs:'); 
       disp(['r : ',num2str(KLargs_r)]);
       disp(['A : ',num2str(KLargs_a)]);
       disp(['C : ',num2str(KLargs_c)]);
       disp(['D : ',num2str(KLargs_d)]);
       disp(['nu : ',num2str(KLargs_rn)])
       disp('\n--------------');
    end
        

    
    for vIndex = 1:length(vArray)
        %traverse all potential
        
        
        %line fit
        
        j = J(:,vIndex);
        
%         disp(['1/j: ',num2str(j')])
        p = polyfit(W,j,1);
        K = p(1);
%         disp(['K=',num2str(K)]);
        
        n = calcNbyLevich(K,KLargs_r,KLargs_a,KLargs_c,KLargs_d,KLargs_n);
        
        
        
        ns(end+1) = n; %#ok<AGROW>
        
        
        
       if verbose 
        disp(['v=',num2str(vArray(vIndex))]);
        disp(['1/j: ',num2str(j')]);
        disp(['K=',num2str(K)]);
        disp(['n=',num2str(n)]);
        disp('--------------'); 
       end
    
            
        
    end
        

end

