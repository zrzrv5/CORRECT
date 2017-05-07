function [ meanY,tx ] = meanOfCircle( circleData,xIndex,yIndex,xRange )
%meanOfCircle 利用插值计算一圈曲线的纵轴平均值
%   circleData:单圈数据,xIndex:横轴物理量所在列数,yIndex:纵轴物理量所在列数,xRange : 指定插值范围.


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

