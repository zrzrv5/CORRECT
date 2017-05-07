function [ meanY,tx ] = meanOfCircle( circleData,xIndex,yIndex,xRange )
%meanOfCircle ���ò�ֵ����һȦ���ߵ�����ƽ��ֵ
%   circleData:��Ȧ����,xIndex:������������������,yIndex:������������������,xRange : ָ����ֵ��Χ.


    [xStart,indexStart] = max([circleData(1,xIndex),circleData(end,xIndex)]);
    
    if indexStart ~= 1
        indexStart = length(circleData);
    end
    
    [xEnd,indexEnd] = max(circleData(:,xIndex));
    
    if xRange(end)>xEnd || xRange(1)<xStart
        disp('Warning! Out of range');
        disp(['Input Range (',num2str(xRange(1)),',',num2str(xRange(end)),') IS NOT A SUBSET OF(',num2str(xStart),',',num2str(xEnd),')']);
    end
   
    if nargin == 4
        tx = xRange;
    else
        tx = linspace(xStart,xEnd,length(circleData));
    end
    
    ty1 = interp1(circleData(1:indexEnd,xIndex),circleData(1:indexEnd,yIndex),tx,'pchip');
    ty2 = interp1(circleData(indexEnd:end,xIndex),circleData(indexEnd:end,yIndex),tx,'pchip');
%     figure;
%     plot(tx,ty1,'r.');
%     hold on
%     plot(tx,ty2,'g*');
%     plot(circleData(:,xIndex),circleData(:,yIndex));

    meanY = (ty1+ty2)./2;


end

