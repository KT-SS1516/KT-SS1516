
fileID = fopen('rfc2324.txt','r');
C = textscan(fileID, '%c');
fclose(fileID);
% Values
vals = unique(C{1});
% Repetitions
reps = hist(double(C{1}), double(vals));
sorted = sort(reps, 'descend');

hold on
title('H�ufigkeiten in abfallender Reihenfolge')
xlabel('Zeichen (sortiert)')
ylabel('H�ufigkeit')
plot(sorted, 'r')
