clear all;
% 读文件
[data_male,data_female] = preprocess('dataset1.txt');
[mydata_male,mydata_female] = preprocess('mydataset.txt');

% 最小错误率贝叶斯决策
disp('*********最小错误率贝叶斯决策结果*********');
[err_m,err_f] = gender_classify(1,mydata_male,mydata_female,data_male,data_female,false);
disp('   A.训练集为采集数据，测试集为给定数据');
disp(['   男性错误率：',num2str(err_m,3),'  女性错误率：',num2str(err_f,3)]);

[err_m,err_f] = gender_classify(1,mydata_male,mydata_female,mydata_male,mydata_female,false);
disp('   B.训练集为采集数据，测试集为采集数据');
disp(['   男性错误率：',num2str(err_m,3),'  女性错误率：',num2str(err_f,3)]);

[err_m,err_f] = gender_classify(1,data_male,data_female,mydata_male,mydata_female,false);
disp('   C.训练集为给定数据，测试集为采集数据');
disp(['   男性错误率：',num2str(err_m,3),'  女性错误率：',num2str(err_f,3)]);

[err_m,err_f] = gender_classify(1,data_male,data_female,mydata_male,mydata_female,false);
disp('   D.训练集为给定数据，测试集为给定数据');
disp(['   男性错误率：',num2str(err_m,3),'  女性错误率：',num2str(err_f,3)]);
disp(' ');

% 最小风险贝叶斯决策
disp('*********最小风险贝叶斯决策结果*********');
[err_m,err_f] = gender_classify(1,mydata_male,mydata_female,data_male,data_female,true);
disp('   A.训练集为采集数据，测试集为给定数据');
disp(['   男性错误率：',num2str(err_m,3),'  女性错误率：',num2str(err_f,3)]);

[err_m,err_f] = gender_classify(1,mydata_male,mydata_female,mydata_male,mydata_female,true);
disp('   B.训练集为采集数据，测试集为采集数据');
disp(['   男性错误率：',num2str(err_m,3),'  女性错误率：',num2str(err_f,3)]);

[err_m,err_f] = gender_classify(1,data_male,data_female,mydata_male,mydata_female,true);
disp('   C.训练集为给定数据，测试集为采集数据');
disp(['   男性错误率：',num2str(err_m,3),'  女性错误率：',num2str(err_f,3)]);

[err_m,err_f] = gender_classify(1,data_male,data_female,mydata_male,mydata_female,true);
disp('   D.训练集为给定数据，测试集为给定数据');
disp(['   男性错误率：',num2str(err_m,3),'  女性错误率：',num2str(err_f,3)]);

% ROC曲线
[Sp1,Sn1] = roc(mydata_male,mydata_female,data_male,data_female,false);
[Sp2,Sn2] = roc(mydata_male,mydata_female,data_male,data_female,true);
figure,plot(1-Sp1,Sn1,'bx-'),title('ROC曲线（训练集为采集数据，测试集为给定数据）');
hold on,plot(1-Sp2,Sn2,'r*-');
legend('最小错误率','最小风险');

[Sp1,Sn1] = roc(data_male,data_female,mydata_male,mydata_female,false);
[Sp2,Sn2] = roc(data_male,data_female,mydata_male,mydata_female,true);
figure,plot(1-Sp1,Sn1,'bx-'),title('ROC曲线（训练集为给定数据，测试集为采集数据）');
hold on,plot(1-Sp2,Sn2,'r*-');
legend('最小错误率','最小风险');
