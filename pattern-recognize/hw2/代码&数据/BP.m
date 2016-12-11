clc
clear
% for k = 1:10
    %************按不同要求取出训练集、测试集数据************%
    [train_m,train_f] = preprocess('dataset3.txt',1,0);
    [test_m,test_f] = preprocess('dataset4.txt',1,0);
    %****************************************************%
    [N1,~] = size(train_m);[N2,~] = size(train_f);
    [n1,~] = size(test_m);[n2,~] = size(test_f);
    traindata = [train_m;train_f];
    testdata = [test_m;test_f];
    % 男性表示为1，女性表示为0
    gender = zeros(N1+N2,1);
    gender(1:N1,1) = 1;
    % 训练数据随机排列
    index = randperm(N1+N2);
    input = traindata(index,:);
    output = gender(index,:);
    % 归一化
    input = mapminmax(input',0,1);
    test = mapminmax(testdata',0,1);
    %创建神经网络,10个隐层神经元，1个输出神经元，隐层和输出层采用sigmoid传输函数
    net = newff(minmax(input),[10 1],{'logsig' 'purelin'},'traingdx'); 
    %设置训练参数
    net.trainparam.show = 50 ; %每间隔100步显示一次训练效果
    net.trainparam.epochs = 500 ; %允许最大训练步数为500
    net.trainparam.goal = 0.01 ; %训练目标最小误差0.01
    net.trainParam.lr = 0.01 ;  %学习速率0.05
    %开始训练
    net = train(net,input,output') ;
    result = sim(net,test);
    err_m = 0;
    err_f = 0;
    for i = 1:n1+n2
        if(i <= n1 && result(i)<=0.5)
            % 本是男性，被误判成女性
            err_m = err_m + 1;
        else
            if(i > n1 && result(i)>0.5)
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