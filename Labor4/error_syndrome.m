%% Calculates the error syndrome of a code 'x' given the error vector 'e'
%% and the parity-check matrix 'H'
function s = error_syndrome(x, e, H)
s = mod((x + e) * H', 2);
end
