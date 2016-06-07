u = [0 1 1 0]
G = [1 1 0 1 0 0 0; 0 1 1 0 1 0 0; 1 1 1 0 0 1 0; 1 0 1 0 0 0 1]
e = [0 1 0 0 0 0 0]

x = codeword(u, G)
H = parity_check_matrix(G)
s = error_syndrome(x, e, H)
