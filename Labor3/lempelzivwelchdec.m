% https://www.cs.duke.edu/csed/curious/compression/lzw.html
function dec = lempelzivwelchdec(enc)
dict = initialdict();
prevcode = enc(1);
entry = dict{prevcode};
dec = entry;
for i = 2:length(enc)
    currcode = enc(i);
    entry = dict{currcode};
    dec = [dec entry];
    ch = entry(1);
    dict{end + 1} = [dict{prevcode} ch];
    prevcode = currcode;
end
end

% Generates an initial dictionary with every ASCII character
function dict = initialdict()
dict = {};
alphabet = char(1:256);
% TODO: optimize
for i = 1:length(alphabet)
    dict{end + 1} = alphabet(i);
end
end
