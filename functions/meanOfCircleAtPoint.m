function [ meanY ] = meanOfCircleAtPoint( x,circleData,xIndex,yIndex )
%meanOfCircleAtPoint 利用插值计算一圈某点处平均值
%circleData:单圈数据,xIndex:横轴物理量所在列数,yIndex:纵轴物理量所在列数

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

