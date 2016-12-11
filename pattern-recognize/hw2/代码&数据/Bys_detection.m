clc
clear
%************按不同要求取出训练集、测试集数据************%
[train_m,train_f] = preprocess('dataset3.txt',1,0);
[test_m,test_f] = preprocess('dataset4.txt',1,0);
%****************************************************%
[~,d] = size(train_m);
%% 男性训练集
ave_m = mean(train_m);
cov_m = cov(train_m);
invsigma_m = inv(cov_m);
%% 女性训练集
ave_f = mean(train_f);
cov_f = cov(train_f);
invsigma_f = inv(cov_f);
%% 男性性别决策
err_m = 0;
for i=1:size(test_m,1)
    pm=exp(-0.5*(test_m(i,:)-ave_m)*invsigma_m*(test_m(i,:)-ave_m)')/(((2*pi)^(d/2))*(det(cov_m))^0.5);
    pf=exp(-0.5*(test_m(i,:)-ave_f)*invsigma_f*(test_m(i,:)-ave_f)')/(((2*pi)^(d/2))*(det(cov_f))^0.5);
    if(pf/pm > 1)
        err_m = err_m + 1;
    else
    end
end
%% 女性性别决策
err_f = 0;
for i = 1:size(test_f,1)
    pm=exp(-0.5*(test_f(i,:)-ave_m)*invsigma_m*(test_f(i,:)-ave_m)')/(((2*pi)^(d/2))*(det(cov_m))^0.5);
    pf=exp(-0.5*(test_f(i,:)-ave_f)*invsigma_f*(test_f(i,:)-ave_f)')/(((2*pi)^(d/2))*(det(cov_f))^0.5);
    if(pm/pf > 1)
        err_f = err_f + 1;
    else
    end
end
%% 计算错误率
err = (err_m + err_f)/(size(test_m,1)+size(test_f,1))