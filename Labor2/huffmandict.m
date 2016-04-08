% symb: Symbols
% p: Probabilities of occurrence
function hd = huffmandict(symb, p)
% Sort the probabilities of occurrence
[p_sorted, sort_index] = sort(p, 'descend');
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
    cLeft = {0};
    cRight = huffman(p(2:length(p)));
    % Add a 1 in the first position for all the codes of the right branch
    for i = 1:length(cRight)
       cRight{i} = [1 cRight{i}]; 
    end
    code = [cLeft;cRight];
end
