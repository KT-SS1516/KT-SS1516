function enc = lempelzivenc(plain, dict, input)
enc = [];
pos = 1;
while pos <= length(plain)
    last = length(plain);
    index = dictindex(plain(pos:last), dict, input);
    while last > 0 && index == -1
        last = last - 1;
        index = dictindex(plain(pos:last), dict, input);
    end
    if last > 0
        enc = [enc, index];
        %fprintf('%s found in i = %d (len = %d)\n', plain(pos:last), index, dict(index, 2));
        pos = pos + dict(index, 2);
    else
        fprintf('Not found any substring in the dictionary for input string %s\n', plain(pos:length(plain)));
    end
end
end

function max = dictindex(str, dict, input)
%fprintf('%s\n', str);
max = -1;
if str(1) == input(1) && length(str) == dict(1, 2)
    current = input(dict(1, 1):dict(1, 2));
    %fprintf('strcmp(%s, %s)\n', str, current);
    if strcmp(str, current)
        max = 1;
    end
end
for i = 1:length(dict) - 1
    if str(1) == dict(i, 3) && length(str) == dict(i + 1, 2)
        current = input(dict(i + 1, 1):dict(i + 1, 1) + dict(i + 1, 2) - 1);
        %fprintf('strcmp(%s, %s)\n', str, current);
        if strcmp(str, current)
            if max == -1 || dict(max, 2) < dict(i + 1, 2)
                max = i + 1;
            end
        end
    end
end
end
