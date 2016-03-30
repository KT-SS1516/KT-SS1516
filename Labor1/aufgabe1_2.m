
fileID = fopen('rfc2324.txt','r');
C = textscan(fileID, '%c');
fclose(fileID);
% Values
vals = unique(C{1});
% Repetitions
reps = hist(double(C{1}), double(vals));
sorted = sort(reps, 'descend');

hold on
title('Häufigkeiten in abfallender Reihenfolge')
xlabel('Zeichen (sortiert)')
ylabel('Häufigkeit')
plot(sorted, 'r')
