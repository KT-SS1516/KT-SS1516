%% Corrects a given message 'y' using the error syndrome 's' and the
%% parity-check matrix 'H'.
%% Returns: corrected message 'x', number of corrected errors 'n' and
%% boolean 'b' if more errors were detected
function [x, n, b] = correct(y, s, H)
if any(s)
     pos = find(ismember(H', s, 'rows'), 1);
     x = mod(y + full(sparse(1, pos, 1, 1, size(y, 2))), 2);
     n = 1;
     b = false;
else
    x = y;
    n = 0;
    b = false;
end
