function [male,female] = preprocess(file_name,lessFeature,lessNum)
%****************************************************
% preprocess函数对数据进行预处理，将男性和女性数据分别导出
% file_name为待处理的txt文件
% lessFeature和lessNum为bool型变量，为1时分别表示
% “只取2个特征“和“随机取10组数据”
%****************************************************
file = fopen(file_name);
data = textscan(file,'%f %f %f %f %f %f %f %f %f %f %c');
fclose(file);
dataset = [data{1},data{2},data{3},data{4},data{5},data{6},...
    data{7},data{8},data{9},data{10}];
fseq = find(data{11}=='F' | data{11}=='f'); 
mseq = find(data{11}=='M' | data{11}=='m');
female = dataset(fseq,:); 
male = dataset(mseq,:); 
% 只取第3和第5个特征
if(lessFeature == true)
    female = female(:,[3 5]);
    male = male(:,[3 5]);
end
% 随机取10个数
if(lessNum == true)
    index1 = randperm(469);
    index2 = randperm(485);
    female = female(index1(1:10),:);
    male = male(index2(1:10),:);
end
end