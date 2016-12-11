function Score = tstatic(feature)
%
% ??t????????????
% feature?eature???????????????[1,5]??
% ???Score????????????
%
[train_m,train_f] = preprocess('dataset3.txt',feature);
[n1, ~] = size(train_m);
[n2, ~] = size(train_f);
% mean
mm = mean(train_m);
mf = mean(train_f);
% var 
Sm = var(train_m);
Sf = var(train_f);
% pooled sample variance
Sp_square = ((n1 - 1) * Sm + (n2 - 1) * Sf)/(n1 + n2 - 2);
Sp = sqrt(Sp_square);
% t-static
Score = (mm - mf)/(Sp * sqrt(1/n1 + 1/n2));
end