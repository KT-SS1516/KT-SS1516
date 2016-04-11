% symb: Symbols
% p: Probabilities of occurrence
function hd = huffmandict(symb, p)
% Sort the probabilities of occurrence
[p_sorted, sort_index] = sort(p, 'ascend');
% Obtain the Huffman codes for the probabilities
codes_huf = huffman(p_sorted);
% Sort the codes in the original order
c_huf(sort_index) = codes_huf;
% Dictionary for the Huffman coding: Cell-Array with:
% - Symbol numbers in the first column
% - Binary code words (binary Arrays) in the second column
hd = [num2cell(symb(1:end)') c_huf'];

function code = huffman(p)
if length(p) == 1
    code = {[]};    % For only one symbol there's no coding needed
elseif length(p) == 2
    code = {0;1};   % For two symbols, coding with 0 and 1
else    
    % Build a list of symbols and probabilities
    for i = 1:length(p)
        s = struct('symb', i, 'prob', p(i));
        aux(i) = s;
        code{i} = [];
    end
    
    while length(aux) > 1
        % Take two elements with least probability and replace them by a
        % subtree
        right = aux(1);
        left = aux(2);
        for i = 1:length(right.symb)
            code{right.symb(i)} = [1 code{right.symb(i)}];
        end
        for i = 1:length(left.symb)
            code{left.symb(i)} = [0 code{left.symb(i)}];
        end
        aux(1) = struct('symb', [right.symb, left.symb], 'prob', right.prob + left.prob);
        aux(2) = [];
        [~, order] = sort([aux(:).prob], 'ascend');
        aux = aux(order);
    end
end
