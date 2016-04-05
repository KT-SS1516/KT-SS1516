
fileID = fopen('rfc2324.txt','r');
C = textscan(fileID, '%c');
fclose(fileID);
% Values
vals = unique(C{1});
% Repetitions
reps = hist(double(C{1}), double(vals));
[sorted, sortIndex] = sort(reps, 'descend');
valsSorted = vals(sortIndex);

yvals = sorted(1:10);
xvals = valsSorted(1:10);

hold on
bar(yvals, 'y')
set(gca, 'XTickLabel', xvals, 'XTick', 1:numel(xvals))
title('Character frequency in rfc2324.txt text')
xlabel('Character')
ylabel('Frequency')
