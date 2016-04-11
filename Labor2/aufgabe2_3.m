function [] = aufgabe2_3(input)
symbols = unique(input);
repetitions = hist(double(input), double(symbols));

% Probability
prob = repetitions ./ sum(repetitions);
% Self-information
i = log2(1 ./ prob);
% Entropy
h = sum(prob) * i;

shannon = shannonfanodict(symbols, prob);
huffman = huffmandict(symbols, prob);

end
