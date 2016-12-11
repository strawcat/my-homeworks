function Fisher(train_m,train_f,test_m,test_f,flag)
%
% Fisher??????
% train_m,train_f??????????????
% test_m,test_f??????????????
% flag=1????????flag=2???????
%
[N1,~] = size(train_m);
[N2,~] = size(train_f);

mm = (mean(train_m))';
mf = (mean(train_f))';
train_m = train_m'; train_f = train_f';
Sm = 0; Sf = 0;
for i = 1:N1
    Sm = Sm + (train_m(:,i) - mm)*(train_m(:,i) - mm)';
end
for i = 1:N2
    Sf = Sf + (train_f(:,i) - mf)*(train_f(:,i) - mf)';
end

Sw = Sm + Sf;
w = inv(Sw) * (mm - mf);
    
err_m = 0;
for i = 1:size(test_m,1)
    g = w'*(test_m(i,:)' - 0.5*(mm + mf));
    if(g < 0)
        err_m = err_m + 1;
    else       
    end
end

err_f = 0;
for i = 1:size(test_f,1)
    g = w'*(test_f(i,:)' - 0.5*(mm + mf));
    if(g > 0)
        err_f = err_f + 1;
    else
    end
end
err = (err_m + err_f)/(size(test_m,1)+size(test_f,1));
switch flag
    case 1
        disp(['The total training error is ',num2str(err)]);
    case 2
        disp(['The total testing error is ',num2str(err)]);
end
end
