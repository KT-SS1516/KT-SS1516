% https://www.cs.duke.edu/csed/curious/compression/lzw.html
function dec = lempelzivwelchdec(enc)
dict = initialdict();
prevcode = enc(1);
entry = dict{prevcode};
dec = entry;
for i = 2:length(enc)
    currcode = enc(i);
    if currcode <= numel(dict) && ~isempty(dict{currcode})
        entry = dict{currcode}; 
    else
        entry = [dict{prevcode} dict{prevcode}(1)];
    end
    dec = [dec entry];
    ch = entry(1);
    dict{end + 1} = [dict{prevcode} ch];
    prevcode = currcode;
end
end

% Generates an initial dictionary with every ASCII character
function dict = initialdict()
dict = cellstr(char(1:256)');
end
