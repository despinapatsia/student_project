%This is the first attempt 
%Author: Despoina Patsia
%Date: 19/2/17
%Imports in matlab the file sensor_data.json using parse_json.m
% makes a graph of the datathe data to a .csv 

fname = 'sensor_data.json';
fid = fopen(fname);
raw = fread(fid,inf);
str = char(raw');
fclose(fid);

data = parse_json(str)

structSize = numel(cell(data.data))
for j = 1:structSize
values{j}=0;
end

for i = 1:1:structSize
    values{i}=cell2mat(data.data{i}(2));
end
Num=cell2mat(values);
for i = 1:1:structSize
    valuesforexp{i,1}=cell2mat(data.data{i}(1));
    valuesforexp{i,2}=cell2mat(data.data{i}(2));
end

tr= valuesforexp';
plot(Num)

fid = fopen('Flow.txt', 'w') ;

 for i=1:1:structSize    
 fprintf(fid, '%s,', tr{1,i}) ;
 fprintf(fid, '%f\n', tr{2,i}) ;
 end

 fclose(fid) ;
 dlmwrite('Flow.txt', tr(2:end,:), '-append') ;

% dlmwrite(filename,valuesforexp)


