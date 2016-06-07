u = [0 1 1 0];
G = [1 1 0 1 0 0 0; 0 1 1 0 1 0 0; 1 1 1 0 0 1 0; 1 0 1 0 0 0 1];
e = [0 1 0 0 0 0 0];

x = codeword(u, G);
H = parity_check_matrix(G);
s = error_syndrome(x, e, H);
x_err = mod(x + e, 2);
[x_corr, nerr, ~] = correct(x_err, s, H);

assert(isequal(x, x_corr) == 1, 'Corrected message doesn''t equal the original one');

fprintf('Used word:'); u
fprintf('Generator matrix:'); G
fprintf('Codeword:'); x
fprintf('Parity-check matrix:'); H
fprintf('Error vector:'); e
fprintf('Error syndrome:'); s
fprintf('Number of corrected errors: %d\n', nerr);
