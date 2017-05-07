function [ ns ] = calcNbyjw(jMat,vArray,wArray,verbose)
%getNbyjw ���ݵ����ܶ���w��ϵ����n
%   jMat : ��������,ÿһ����ͬһw�²�ͬ��ѹ�µĵ���
%   vArray : ��ѹ����,
%   wArray : w����
%   ns : ���n����

    %initial set up
    
    if nargin == 3
        verbose = false;
        
    end
    
    ns = [];
    W = wArray.^(-1/2);
    W = W';
    
    J = 1./jMat;
    
    if verbose 
       disp('--------------'); 
    end
        
     
    for vIndex = 1:length(vArray)
        %traverse all potential
        
        
        %line fit
        
        j = J(:,vIndex);
        
%         disp(['1/j: ',num2str(j')])
        p = polyfit(W,j,1);
        K = p(1);
%         disp(['K=',num2str(K)]);
        
        n = calcNbyLevich(K);
        
        
        
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

