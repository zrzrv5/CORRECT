function [ n,handler ] = calcNfromFiles( filenames,omegaArray,vArray,KLargs,displayResult )
%getNfromFiles 由不同omega下的.cor文件计算电子转移数
%   filenames: 文件名cell数组 *注意*应使用{}而非[]
%   omegaArray : omega数组,应与filenames相符
%   vArray : 电压范围
%   KLargs : K-L方程参数数组[r,A,C,D,nu],具体参见calcNbyjw.
%   displayResult : 是否显示计算过程与结果.可省略,当电压过多时建议省略
%   n : 与vArray对应的电子转移数n
%   handler : 图像句柄

     if nargin == 4
         displayResult = false;
     end
     
     if ~isequal(size(KLargs),[1,5]) 
        error('Error : Arguments not suit for K-L equations. \n eg. [r,A,C,D,nu] please visit calcNbyLevich for more details.');
    end

    

     rawJMat = zeros(length(omegaArray),length(vArray));
     
     for fileIndex = 1:length(filenames)
    
    fileData = corRead(filenames{fileIndex},'%f %f %f',3);
    
    circleData = fileData.circle1;

    [y,~] = meanOfCircle(circleData,1,2,vArray);
    
    
    rawJMat(fileIndex,:) = y ;
    

         
     end
    disp('data parse complete')

    n = calcNbyjw(rawJMat,vArray,omegaArray,KLargs,displayResult);

     figure;
    handler = plot(vArray,n);

     

end

