function [ meanY ] = meanOfCircleAtPoint( x,circleData,xIndex,yIndex )
%meanOfCircleAtPoint ���ò�ֵ����һȦĳ�㴦ƽ��ֵ
%circleData:��Ȧ����,xIndex:������������������,yIndex:������������������

    [xStart,indexStart] = max([circleData(1,xIndex),circleData(end,xIndex)]);
    
    if indexStart ~= 1
        indexStart = length(circleData);
    end
    
    [xEnd,indexEnd] = max(circleData(:,xIndex));
    
%     tx = linspace(xStart,xEnd,length(circleData));
    if x>xEnd || x<xStart
        disp('Warning! Out of range');
        disp([num2str(x),'IS NOT AN ELEMENT OF(',num2str(xStart),',',num2str(xEnd),')']);
    end
    
    ty1 = interp1(circleData(1:indexEnd,xIndex),circleData(1:indexEnd,yIndex),x,'spline');
    ty2 = interp1(circleData(indexEnd:end,xIndex),circleData(indexEnd:end,yIndex),x,'spline');
%     figure;
%     plot(tx,ty1,'r.');
%     hold on
%     plot(tx,ty2,'g*');
%     plot(circleData(:,xIndex),circleData(:,yIndex));

    meanY = (ty1+ty2)./2;


end

