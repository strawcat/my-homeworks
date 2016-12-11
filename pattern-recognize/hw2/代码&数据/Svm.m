clc
clear
% for k = 1:30
    %************按不同要求取出训练集、测试集数据************%
    [train_m,train_f] = preprocess('dataset3.txt',0,0);
    [test_m,test_f] = preprocess('dataset4.txt',0,0);
    %****************************************************%
    [N1,~] = size(train_m);[N2,~] = size(train_f);
    [n1,~] = size(test_m);[n2,~] = size(test_f);
    traindata = [train_m;train_f];
    testdata = [test_m;test_f];
    for i = 1:N1+N2
        if(i <= N1)
            gender{i} = 'male';
        else
            gender{i} = 'female';
        end
    end
    svmStruct = svmtrain(traindata,gender');
    result = svmclassify(svmStruct,testdata);
    err_m = 0;
    err_f = 0;
    for i = 1:n1+n2
        if(i <= n1 && strcmp(result{i},'female')==1)
            % 本是男性，被误判成女性
            err_m = err_m + 1;
        else
            if(i > n1 && strcmp(result{i},'male')==1)
                % 本是女性，被误判成男性
                err_f = err_f + 1;
            else
            end
        end
    end
    err = (err_m + err_f)/(n1+n2);
%     err(k) = (err_m + err_f)/(n1+n2);
% end
% mean(err)