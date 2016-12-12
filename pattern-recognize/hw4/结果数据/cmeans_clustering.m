function label = cmeans_clustering(data,num)
% data为样本数据，num为聚类数目
[N n] = size(data);
err_T = 0.001;
% Randomly select clustering centers
randindex = randperm(N);
for i=1:num
    c(i,:) = data(randindex(i),:);
end

while 1
    sum = zeros(num,n);
    count = zeros(num,1);
   
    for i = 1:N
        for j = 1:num           
            dis(j) = norm(data(i,:)-c(j,:));
        end
        [whatever,cmemorize(i)] = min(dis); 
        sum(cmemorize(i),:) = sum(cmemorize(i),:) + data(i,:);
        count(cmemorize(i)) = count(cmemorize(i)) + 1;
    end
    for i = 1:num
        core(i,:) = sum(i,:)/count(i);
        err(i) = norm(c(i)-core(i));
    end
    if(max(err) < err_T)
        break;
    else
        c = core;
    end
end
label = cmemorize';
% Calculate WCSS(Within-Cluster Sum of Squares)
wcss = 0;
for i = 1:N
    wcss = wcss + norm(data(i,:) - c(cmemorize(i),:));
end
fprintf('The WCSS is %f when the number of clusters is %d\n',wcss,num);
