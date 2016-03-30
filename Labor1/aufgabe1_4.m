
fileID = fopen('rfc2324.txt','r');
C = textscan(fileID, '%c');
fclose(fileID);
% Values
vals = unique(C{1});
% Repetitions
reps = hist(double(C{1}), double(vals));
[sorted, sortIndex] = sort(reps, 'descend');
valsSorted = vals(sortIndex);

p = sorted ./ sum(sorted);
i = log2(1 ./ p);

yvals = p(1:20);
xvals = valsSorted(1:20);

figure(1)
title('Probability');
xlabel('Zeichen (sortiert)')
ylabel('Probability')
set(gca, 'XTickLabel', xvals, 'XTick', 1:numel(xvals))
bar(yvals, 'y')

yvals = i(1:20);

figure(2)
title('Informationsgehalt')
xlabel('Zeichen (sortiert)')
ylabel('Informationsgehalt')
set(gca, 'XTickLabel', xvals, 'XTick', 1:numel(xvals))
bar(yvals, 'y')
