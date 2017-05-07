function [ n,handler ] = calcNfromFiles( filenames,omegaArray,vArray,KLargs,displayResult )
%getNfromFiles �ɲ�ͬomega�µ�.cor�ļ��������ת����
%   filenames: �ļ���cell���� *ע��*Ӧʹ��{}����[]
%   omegaArray : omega����,Ӧ��filenames���
%   vArray : ��ѹ��Χ
%   KLargs : K-L���̲�������[r,A,C,D,nu],����μ�calcNbyjw.
%   displayResult : �Ƿ���ʾ�����������.��ʡ��,����ѹ����ʱ����ʡ��
%   n : ��vArray��Ӧ�ĵ���ת����n
%   handler : ͼ����

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

