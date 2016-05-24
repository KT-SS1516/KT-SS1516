function dict = lempelzivdict(input)
dict = zeros(1, 3);
i = 1;
pos = 1;
while pos <= length(input)
    len = 0;
    while (pos + len < length(input)) && ~isempty(strfind(input(1:pos), input(pos:(pos + len))))
        len = len + 1;
    end
    
    % TODO: workaround
    if len == 0
        pos = length(input) + 1;
    else
        %fprintf('pos: %d, len: %d, str: %s\n', pos, len, input(pos:(pos+len)));
        next = input(pos + len);
        dict(i, :) = [pos, len, next];
        i = i + 1;
        pos = pos + len;
    end
end
dict(length(dict), 3) = -1;
end
