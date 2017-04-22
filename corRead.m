function [ Data ] = corRead(filePath,dataFormat,column,verbose)
%corRead  读取cor文件
%   filePath:文件地址;dataFormat:行数据格式;column:行数据列数;verbose:可省略.
%   filePath:文件地址;dataFormat:行数据格式;column:行数据列数;verbose:可省略.


    if nargin == 3
        verbose = false;
    end
    fid = fopen(filePath);
    
    tline = fgetl(fid);
    
    dataBegin = false;
    

    
    CircleData = zeros(1,column);
    
    Data = struct;
    
    while ischar(tline)
%         debug
%         disp(tline);
        
        
        if  isequal(tline,'End Comments')
            dataBegin = true;
            tline = fgetl(fid);
            if ischar(tline) == false
                disp('Error! EOF');
            end
                
        end
        
        if dataBegin == true
            
           rowData = sscanf(tline,dataFormat); 
            
           if length(rowData) == column
               CircleData(end+1,:) = rowData;
           elseif length(rowData) == column+1
                CircleData(end+1,:) = rowData(1:end-1);
               Data.(['circle',num2str(rowData(column+1)+1)]) = CircleData(2:end,:);
               CircleData = zeros(1,column);
           else
               disp('Error@');
               disp(tline);
           end
        elseif verbose
           disp(tline); 
        end

        tline = fgetl(fid);
    end
    
    fclose(fid);

end

