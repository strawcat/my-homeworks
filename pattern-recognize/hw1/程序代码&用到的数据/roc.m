function [Sp,Sn] = roc(train_m,train_f,test_m,test_f,minRisk)
i = 1;
for thre = 0.1:0.1:10
    [err_m,err_f] = gender_classify(thre,train_m,train_f,test_m,test_f,minRisk);
    % 设结果为男性时是阳性
    Sn(i)=1-err_m;      
	Sp(i)=1-err_f;
    i = i + 1;
end
    
end