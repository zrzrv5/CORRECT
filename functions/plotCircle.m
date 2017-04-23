function [ h ] = plotCircle( data,xIndex,yIndex,circles,colormapName )
%plotCircle ����ָ��Ȧ����Χ��ͼ��,Ĭ���������ȫ���Ե�һ��Ϊ����,�ڶ���Ϊ�����ͼ��
%   �˴���ʾ��ϸ˵��

    fields = {};
    if nargin == 1 
        xIndex = 1;
        yIndex = 2;
        colormapName = 'jet';
        fields = fieldnames(data);
    else
        
        for i = circles
            fields{end+1} = ['circle',num2str(1)];
        end
    end
    
    h = figure;
    hold on;
%     colors = gradientColor([0,0,0.5625],[0.])

    circleCount = length(fields);
    
    eval(['colors = ',colormapName,'(circleCount);']);
    t_cc = [];
    for ci = 1:circleCount
     t_cc(end+1) = str2double(strrep(fields{ci},'circle','')) ; %#ok<AGROW>
        cData = data.(fields{ci});
        plot(cData(:,xIndex),cData(:,yIndex),'Color',colors(ci,:)); %#ok<NODEF>
        
    end
    
    bar = colorbar;
    bar.Limits = [min(t_cc) max(t_cc)];
    bar.Label.String = 'Circles';
    caxis([min(t_cc) max(t_cc)]);
    colormap(colors);
    hold off;
    
    
    
    
    
    

end

