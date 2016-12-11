function sil = silhouette(data,count,cmemorize,k)

[N n] = size(data);
sil_all = zeros(N,1);
for i = 1:N
    cluster = cmemorize(i);
    cohesion_sum = 0;   % ??????
    separation_sum = zeros(k,1); % ??????
    separation_tmp = zeros(k,1);
    for j = 1:N
        if(cmemorize(j) == cluster)
            % ??????????
            cohesion_sum = cohesion_sum + norm(data(i,:)-data(j,:));
        else
            % ??????????
            separation_sum(cmemorize(j)) = separation_sum(cmemorize(j)) + norm(data(i,:)-data(j,:));
        end
    end
    % ??i????????????????
    cohesion = cohesion_sum/(count(cluster)-1);
    % ??i????????????????,????????
    for p = 1:k
        separation_tmp(p) =  separation_sum(p)/count(p);
    end
    [separation_order,order] = sort(separation_tmp,'descend'); 
    separation = separation_order(k-1);
    % ??i??????????????????
    sil_all(i) = (separation-cohesion)/max(separation,cohesion);
end
sil = mean(sil_all);