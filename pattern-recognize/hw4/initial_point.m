function c = initial_point(data,k,i)
% 本函数从样本数据data中使用第i种方法确定k个初始点
% 返回值c为k行n列的初始点信息

switch i
    case 1
        % 取data中的前k个作为中心点
        for i = 1:k
            c(i,:) = data(i,:);
        end
    case 2
        % 随机取k个点作为中心点
        [N n]=size(data);
        randindex = randperm(N);%产生1到N的随机排列
        for i=1:k
            c(i,:) = data(randindex(i),:);
        end
    case 3
        % 选择彼此距离尽可能远的k个点
        [N n]=size(data);
        randindex = randperm(N);
        c(1,:) = data(randindex(1),:);
        for i = 2:k
            for j = 1:N
                % 样本点到已确定中心点的距离(取最小)
                for p = 1:i-1
                    distance(p) = norm(data(j,:)-c(p,:));
                end
                min_dis(j) = min(distance);
            end
            [whatever index] = max(min_dis);
            c(i,:) = data(index,:);
        end
end
end