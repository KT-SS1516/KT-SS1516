fileID = fopen('rfc2324.txt', 'r');
C = textscan(fileID, '%c');
fclose(fileID);
input = C{1}';
symbols = unique(input);
repetitions = hist(double(input), double(symbols));

% Probability
prob = repetitions ./ sum(repetitions);
% Self-information
i = log2(1 ./ prob);
% Entropy
h = sum(prob .* i);
% Redundancy (8 bits/char)
r = sum(prob .* 8) - h;

lzw_enc = lempelzivwelchenc(input);
lzw_dec = lempelzivwelchdec(lzw_enc);
assert(strcmp(lzw_dec, input) == 1, 'Lempel-Ziv-Welch coding output doesn''t match input');

fprintf('Length in bits of the message without using any encoding:          %d\n', length(input));
fprintf('Lenght in bits of the message using the Lempel-Ziv-Welch encoding: %d\n', length(lzw_enc));

% Redundancy
r_plain = sum(prob .* 8) - h;
r_lzw = length(lzw_enc) / length(input) - h;

fprintf('Redundancy of the message without using any encoding:              %d\n', r_plain);
fprintf('Redundancy of the message using the Lempel-Ziv-Welch encoding:     %d\n', r_lzw);
