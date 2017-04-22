function [ meanY,tx ] = meanOfCircle( circleData,xIndex,yIndex )
%meanOfCircle ���ò�ֵ����һȦ���ߵ�ƽ��ֵ
%   circleData:��Ȧ����,xIndex:������������������,yIndex:������������������


    [xStart,indexStart] = max([circleData(1,xIndex),circleData(end,xIndex)]);
    
    if indexStart ~= 1
        indexStart = length(circleData);
    end
    
    [xEnd,indexEnd] = max(circleData(:,xIndex));
    
    tx = linspace(xStart,xEnd,length(circleData));
    
    
    ty1 = interp1(circleData(1:indexEnd,xIndex),circleData(1:indexEnd,yIndex),tx,'pchip');
    ty2 = interp1(circleData(indexEnd:end,xIndex),circleData(indexEnd:end,yIndex),tx,'pchip');
%     figure;
%     plot(tx,ty1,'r.');
%     hold on
%     plot(tx,ty2,'g*');
%     plot(circleData(:,xIndex),circleData(:,yIndex));

    meanY = (ty1+ty2)./2;


end

