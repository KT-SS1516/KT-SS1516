% Parity-Check-Matrix
function H = aufgabe4_3_2(G, n)
k = size(G, 1);
P = G(:, 1:k-1);
I = G(:, k:size(G, 2));
H = [I(1:n-k, 1:n-k) P'];
end

