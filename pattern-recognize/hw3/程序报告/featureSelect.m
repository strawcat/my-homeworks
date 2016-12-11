clc
clear
%
% ????JudgeByDistance???tstatic????????????
% ??????????????????
%
K = input('How many features you want to choose: ');
%% ??????????
select = input('Please input 1~5 in represent of J1~J5: ');
% combinations of 10 features taken K at a time
combination = nchoosek([1,2,3,4,5,6,7,8,9,10],K);
for i = 1:size(combination)
    Score1(i) = JudgeByDistance(combination(i,:), select);
end
[max,index1] = max(Score1);
disp(['(J1~J5)Recommended feature(s): ',num2str(combination(index1, :))]);

%% t????????
for i = 1:10
    Score2(i) = tstatic(i);
end
[ordered,index2] = sort(Score2, 'descend');
disp(['(t-test)Recommended feature(s): ',num2str(index2(1:K))]);