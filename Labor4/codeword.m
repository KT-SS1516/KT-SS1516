%% Calculates the code for a given word 'u' using the generator matrix 'G'
function x = codeword(u, G)
x = mod(u * G, 2);
end