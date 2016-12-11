clc
clear
%
% ???K_L????????????????
%
nums = 2;
%% ????????????????
file = fopen('dataset3.txt');
data = textscan(file,'%f %f %f %f %f %f %f %f %f %f %c');
fclose(file);
dataset3 = [data{1},data{2},data{3},data{4},data{5},data{6},...
    data{7},data{8},data{9},data{10}];
data3_f = dataset3(1:469,:);
data3_m = dataset3(470:954,:);
file = fopen('dataset4.txt');
data = textscan(file,'%f %f %f %f %f %f %f %f %f %f %c');
fclose(file);
dataset4 = [data{1},data{2},data{3},data{4},data{5},data{6},...
    data{7},data{8},data{9},data{10}];
%%
% Average
mm = (mean(data3_m))';
mf = (mean(data3_f))';
m = (mean(dataset3))';
% Inter-Class Dispersion Matrix
Sb=0.5*(mm-m)*(mm-m)'+0.5*(mf-m)*(mf-m)';
% In-Class Dispersion Matrix
cov_m=cov(data3_m);  
cov_f=cov(data3_f);
Sw=0.5*(cov_m+cov_f);  

[U,D] = eig(Sw);
lamda = diag(D);
Y = (U' * dataset3')';
for i = 1:10
    Score(i) = (U(:,i)' * Sb * U(:,i))/lamda(i);
end
[ordered,index] = sort(Score,'descend');
% transform matrix
U = U(:,index(1:nums));
% new features
Y3 = Y(:,index(1:nums));
Y3_f = Y3(1:469,:); Y3_m = Y3(470:954,:);
Y4 = dataset4 * U;
Y4_f = Y4(1:78,:); Y4_m = Y4(79:328,:);
% Calculate Error rate
Fisher(Y3_m,Y3_f,Y3_m,Y3_f,1);
Fisher(Y3_m,Y3_f,Y4_m,Y4_f,2);
