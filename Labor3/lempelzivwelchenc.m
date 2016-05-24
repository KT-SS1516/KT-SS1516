% https://www.cs.duke.edu/csed/curious/compression/lzw.html
function enc = lempelzivwelchenc(plain)
enc = [];
dict = initialdict();
s = [];

for i = 1:length(plain)
    ch = plain(i);
    if ~isempty(find(strcmp(dict, [s ch]), 1))
        s = [s ch];
    else
        enc = [enc find(strcmp(dict, s), 1)];
        dict{end + 1} = [s ch];
        s = ch;
    end
end
enc = [enc find(strcmp(dict, s), 1)];
end

% Generates an initial dictionary with every ASCII character
function dict = initialdict()
dict = num2cell(char(0:255)');
end
