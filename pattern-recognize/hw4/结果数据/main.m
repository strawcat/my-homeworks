clear
file = fopen('dataset3.txt');
data = textscan(file,'%f %f %f %f %f %f %f %f %f %f %c');
fclose(file);
dataset = [data{1},data{2},data{3},data{4},data{5},data{6},...
    data{7},data{8},data{9},data{10}];
% 主成分分析
cprs_data = pca_compress(dataset,0.8);
cprs_data = cprs_data';
% 指定聚类数目
cluster = 2;
label = cmeans_clustering(cprs_data,cluster);
plot(cprs_data(label==1,1),cprs_data(label==1,2),'r*');
hold on;
plot(cprs_data(label==2,1),cprs_data(label==2,2),'b*');
hold on;
plot(cprs_data(label==3,1),cprs_data(label==3,2),'g*');
hold on;
plot(cprs_data(label==4,1),cprs_data(label==4,2),'y*');
hold on;
plot(cprs_data(label==5,1),cprs_data(label==5,2),'c*');
hold on;
plot(cprs_data(label==6,1),cprs_data(label==6,2),'m*');
