%% Calculates the parity-check matrix of a given generator matrix 'G'
function H = parity_check_matrix(G)
k = size(G, 1);
n = size(G, 2);
P = G(:, 1:k-1);
I = G(:, k:size(G, 2));
H = [I(1:n-k, 1:n-k) P'];
end

