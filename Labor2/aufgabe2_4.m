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

sh_dict = shannonfanodict(symbols, prob);
hf_dict = huffmandict(num2cell(symbols), prob);

seq = changem(double(input), 1:length(symbols), symbols);
arith_enc = arithenco(seq, repetitions);
shannon_enc = huffmanenco(double(input), sh_dict);
huffman_enc = huffmanenco(double(input), hf_dict);
arith_dec = arithdeco(arith_enc, repetitions, length(seq));
shannon_dec = huffmandeco(shannon_enc, sh_dict);
huffman_dec = huffmandeco(huffman_enc, hf_dict);

assert(isequal(seq, arith_dec), 'Arithmetic coding output doesn''t match input');
assert(strcmp(char(shannon_dec)', input) == 1, 'Shannon-Fano coding output doesn''t match input');
assert(strcmp(char(huffman_dec)', input) == 1, 'Huffman coding output doesn''t match input');

fprintf('Length in bits of the message without using any encoding:    %d\n', length(input) * 8);
fprintf('Length in bits of the message using the arithmetic coding:   %d\n', length(arith_enc));
fprintf('Length in bits of the message using the Shannon-Fano coding: %d\n', length(shannon_enc));
fprintf('Length in bits of the message using the Huffman coding:      %d\n', length(huffman_enc));

% Redundancy
r_plain = sum(prob .* 8) - h;
r_arith = length(arith_enc) / length(input) - h;
len_shannon = cellfun('length', sh_dict);
r_shannon = sum(prob .* len_shannon(:, 2)') - h;
len_huffman = cellfun('length', hf_dict);
r_huffman = sum(prob .* len_huffman(:, 2)') - h;

fprintf('Redundancy of the message without using any encoding:        %f\n', r_plain);
fprintf('Redundancy of the message using the arithmetic coding:       %f\n', r_arith);
fprintf('Redundancy of the message using the Shannon-Fano coding:     %f\n', r_shannon);
fprintf('Redundancy of the message using the Huffman coding:          %f\n', r_huffman);
