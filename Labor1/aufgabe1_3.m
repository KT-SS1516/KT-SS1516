
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
title('Häufigkeiten in abfallender Reihenfolge')
xlabel('Zeichen (sortiert)')
ylabel('Häufigkeit')
set(gca, 'XTickLabel', xvals, 'XTick', 1:numel(xvals))
bar(yvals, 'y')
