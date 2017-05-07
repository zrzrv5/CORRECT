function [ ns ] = calcNbyjw(jMat,vArray,wArray,verbose)
%getNbyjw 根据电流密度与w关系计算n
%   jMat : 电流矩阵,每一行是同一w下不同电压下的电流
%   vArray : 电压数组,
%   wArray : w数组
%   ns : 输出n数组

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

