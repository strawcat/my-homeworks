function cprs_data = pca_compress(data,rerr)
% 主成分分析函数
% data为样本数据，rerr为方差阈值
[N,n] = size(data);
% 样本数据规范化
data_ave = mean(data);   
data_delta = std(data); 
for i = 1:n
    data_norm(:,i) = (data(:,i) - data_ave(i))/data_delta(i);
end
data_norm = data_norm';
% 求协方差矩阵
A = data_norm * data_norm';

[Q,D] = eig(A);
d = diag(D);  
[d_order,order] = sort(d,'descend'); 
d_order = d_order/(N-1);
for i = 1:n
    Q_order(:,i) = Q(:,order(i));
end
% 绘制各个主成分的方差
plot(d_order,'-s');
% 求模式矢量
for m = n-1:-1:1
    err = sum(d_order(m+1:n))/n;
    if(err >= 1 - rerr)
        m = m+1;
        break;
    end
end
pcs = Q_order(:,1:m);
cprs_data = pcs' * data_norm;
