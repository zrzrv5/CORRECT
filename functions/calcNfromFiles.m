function [ n,handler ] = calcNfromFiles( filenames,omegaArray,vArray,displayResult )
%getNfromFiles �ɲ�ͬomega�µ�.cor�ļ��������ת����
%   filenames: �ļ���cell���� *ע��*Ӧʹ��{}����[]
%   omegaArray : omega����,Ӧ��filenames���
%   vArray : ��ѹ��Χ
%   displayResult : �Ƿ���ʾ�����������.��ʡ��,����ѹ����ʱ����ʡ��
%   n : ��vArray��Ӧ�ĵ���ת����n
%   handler : ͼ����

     if nargin == 3
         displayResult = false;
     end
     

     rawJMat = zeros(length(omegaArray),length(vArray));
     
     for fileIndex = 1:length(filenames)
    
    fileData = corRead(filenames{fileIndex},'%f %f %f',3);
    
    circleData = fileData.circle1;

    [y,~] = meanOfCircle(circleData,1,2,vArray);
    
    
    rawJMat(fileIndex,:) = y ;
    

         
     end
    disp('data parse complete')

    n = calcNbyjw(rawJMat,vArray,omegaArray,displayResult);

     figure;
    handler = plot(vArray,n);

     

end

