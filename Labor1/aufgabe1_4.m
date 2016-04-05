
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

hold on
subplot(2, 1, 1)
bar(yvals, 'y')
set(gca, 'XTickLabel', xvals, 'XTick', 1:numel(xvals))
title('Character probability in rfc2324.txt text')
xlabel('Character')
ylabel('Probability')

yvals = i(1:20);

subplot(2, 1, 2)
bar(yvals, 'y')
set(gca, 'XTickLabel', xvals, 'XTick', 1:numel(xvals))
title('Character self-information in rfc2324.txt text')
xlabel('Character')
ylabel('Self-information')
