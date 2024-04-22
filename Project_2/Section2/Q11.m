S = generate_DST_matrix(5);
S_inv = inv(S);

% Multiply S by its inverse
Sout = S * S_inv;

% Display Inverses
disp(S);
disp(S_inv);
disp(Sout);