clc
clear
%
% ???????????Fisher????????????
% ??????????
%
feature = input('Please input the feature(s) you want to use:(In the form of a matrix)\n');

[train_m,train_f] = preprocess('dataset3.txt',feature);
[test_m,test_f] = preprocess('dataset4.txt',feature);

Fisher(train_m,train_f,train_m,train_f,1);
Fisher(train_m,train_f,test_m,test_f,2);